import os
import pandas as pd
import json

from langchain.agents import Tool
from langchain.chat_models import ChatOpenAI

from utils import Neo4jDatabase
from utils import SQLDatabase
from tqdm import tqdm
import argparse

def print_args(args):
    for arg in vars(args):
        print(f"{arg}: {getattr(args, arg)}")

def load_db(db_engine, db_file_path, database_type):

    if database_type == "graph":
        file=open(db_file_path, "r")
        queries_list = file.readlines()
        db_engine.query("match (n) detach delete n;")
        for line in tqdm(queries_list):
            db_engine.query(line)
    
    elif database_type == "relational":
        file=open(db_file_path, "r")
        queries_list = file.readlines()
        db_engine.query("drop database DQA_rdb;")
        db_engine.query("create database DQA_rdb;")
        db_engine.query("use DQA_rdb;")

        for line in tqdm(queries_list):
            db_engine.query(line)
    else:
        print("database type error")
        assert(0)

def read_config(config_path):
    with open(config_path, "r") as f:
        config = json.load(f)
    return config

def fake_tool(query):
    return ""

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--technique", help="SingleRAG, IterRAG, PlanRAG or PlanRAG_woReplan", type=str, default="PlanRAG")
    parser.add_argument("--scenario", help="locating or building", type=str, default="locating")
    parser.add_argument("--database", help="graph or relational", type=str, default="graph")
    parser.add_argument("--question_num", type=int, default=1)
    args = parser.parse_args()
    print_args(args)

    config = read_config("./config.json")

    os.environ["OPENAI_API_KEY"] = config['OPENAI_API_KEY']
    pd.set_option("display.max_rows", 200)
    pd.set_option('display.max_colwidth', 1000)

    # Setup database
    scenario = args.scenario
    question_num = args.question_num
    database_type = args.database

    if scenario == "building":
        from data_loaders.building import building_dataloader, GDB_INFO, RDB_INFO
        question, _, country = building_dataloader(question_num, question_path = "./data/building/questions/simulated_questions.json")
    elif scenario == "locating":
        from data_loaders.locating  import locating_dataloader, GDB_INFO, RDB_INFO
        question, _, _ = locating_dataloader(question_num, "./data/locating/questions/standard/simulated_question.json", option=False)
    else:
        assert(0)

    if database_type == "graph":
        db_name = "neo4j"
        db_config = config['NEO4J']
        db_engine = Neo4jDatabase(host=db_config['HOST'], user=db_config['USER'], password=db_config['PASSWORD'], database=db_name)

        tool_name = "Graph DB"
        tool_description = """Useful for when you need to collect the data that follows the following schema (You MUST generate a Cypher query statement to interact with this tool):""" + GDB_INFO

        if scenario == "building":
            db_file_path = f"./data/{scenario}/db_query(parsed)/LPG_format/{country}.cql"
        elif scenario == "locating":
            db_file_path = f"./data/{scenario}/db_query(parsed)/LPG_format/q{question_num}.cql"

    elif database_type == "relational":
        db_name = "DQA_rdb"
        db_config = config['MYSQL']
        db_engine = SQLDatabase.from_uri(f"mysql+pymysql://{db_config['USER']}@{db_config['HOST']}/{db_name}")

        tool_name = "Relational DB"
        tool_description = """Useful for when you need to collect the data that follows the following schema (You MUST generate a MySQL statement to interact with this tool):""" + RDB_INFO

        if scenario == "building":
            db_file_path = f"./data/{scenario}/db_query(parsed)/SQL_format/{country}.sql"
        elif scenario == "locating":
            db_file_path = f"./data/{scenario}/db_query(parsed)/SQL_format/q{question_num}.sql"

    else:
        assert(0)
    
    load_db(db_engine, db_file_path, database_type=database_type)

    # Database as a tool
    databases = [
        Tool(
            name=tool_name,
            func=db_engine.query,
            description=tool_description
            #Specific conditions should be given when you ask.
        ),
        Tool(
            name="Self thinking",
            func=fake_tool,
            description="""
            Useful for when there is no available tool.
            """
        )
    ]

    # Prepare TaskManager agent
    technique = args.technique
    if technique == "SingleRAG":
        from techniques.SingleRAG.base import TaskManagerSingleRAG
        TaskManager = TaskManagerSingleRAG(db_engine)
    elif technique == "IterRAG":
        from techniques.IterRAG.base import TaskManagerChain as TaskManager
    elif technique == "PlanRAG":
        from techniques.PlanRAG.PlanRAG.base import TaskManagerChain as TaskManager
    elif technique == "PlanRAG_woReplan":
        from techniques.PlanRAG.PlanRAG_woReplan.base import TaskManagerChain as TaskManager
    else:
        assert(0)

    llm = ChatOpenAI(temperature=0, model_name="gpt-4", max_retries=40)
    taskManager = TaskManager.from_llm_and_tools(llm=llm, tools=databases, verbose = True)
    taskManager.run(question)
