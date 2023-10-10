import os
import pandas as pd
import json

from langchain.agents import Tool
from langchain.chat_models import ChatOpenAI

from utils import Neo4jDatabase
from tqdm import tqdm
import argparse

def print_args(args):
    for arg in vars(args):
        print(f"{arg}: {getattr(args, arg)}")

def load_db(db_engine, db_file_path):
    file=open(db_file_path, "r")
    queries_list = file.readlines()
    db_engine.query("match (n) detach delete n;")
    for line in tqdm(queries_list):
        db_engine.query(line)

def read_config(config_path):
    with open(config_path, "r") as f:
        config = json.load(f)
    return config

def fake_tool(query):
    return ""

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--technique", help="RAG or PlanRAG or PlanRAG_woReplan", type=str, default="PlanRAG")
    parser.add_argument("--dataset", help="trading or industry", type=str, default="trading")
    parser.add_argument("--question_num", type=int, default=1)
    args = parser.parse_args()
    print_args(args)
    config = read_config("./config.json")

    os.environ["OPENAI_API_KEY"] = config['OPENAI_API_KEY']
    pd.set_option("display.max_rows", 200)
    pd.set_option('display.max_colwidth', 1000)

    # Prepare dataset & Setup database
    dataset = args.dataset
    question_num = args.question_num
    if dataset == "industry":
        from data_loaders.industry import industry_dataloader, GDB_INFO
        question, db_name, country = industry_dataloader(question_num, question_path = "./data/industry/questions/simulated_questions.json")
        db_file_path = f"./data/industry/db_query(parsed)/LPG_format/{country}.cql"
    elif dataset == "trading":
        from data_loaders.trading  import trading_dataloader, GDB_INFO
        question, _, db_name = trading_dataloader(question_num, "./data/trading/questions/standard/simulated_question.json", option=False)
        db_file_path = f"./data/trading/db_query(parsed)/LPG_format/q{question_num}.cql"
    else:
        assert(0)

    db_config = config['NEO4J']
    db_engine = Neo4jDatabase(host=db_config['HOST'], user=db_config['USER'], password=db_config['PASSWORD'], database=db_name)
    load_db(db_engine, db_file_path)

    # Database as a tool
    databases = [
        Tool(
            name="Graph DB",
            func=db_engine.query,
            description="""
            Useful for when you need to collect the data that follows the following schema (You MUST generate a Cypher query statement to interact with this tool):"""
            + GDB_INFO
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
    if technique == "RAG":
        from techniques.RAG.base import TaskManagerChain as TaskManager
    elif technique == "PlanRAG":
        from techniques.PlanRAG.PlanRAG.base import TaskManagerChain as TaskManager
    elif technique == "PlanRAG_woReplan":
        from techniques.PlanRAG.PlanRAG_woReplan.base import TaskManagerChain as TaskManager
    else:
        assert(0)

    llm = ChatOpenAI(temperature=0, model_name="gpt-4", max_retries=40)
    taskManager = TaskManager.from_llm_and_tools(llm=llm, tools=databases, verbose = True)
    taskManager.run(question)
