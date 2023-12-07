import os
import pandas as pd
import json

from langchain.agents import Tool
from langchain.chat_models import ChatOpenAI
from langchain.llms import Ollama
from langchain.memory import ConversationBufferMemory, ReadOnlySharedMemory

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

parser = argparse.ArgumentParser()
parser.add_argument("--technique", help="PlanRAG", type=str, default="PlanRAG")
parser.add_argument("--agent", help="dual or tri", type=str, default="dual")
parser.add_argument("--use_memory", help="True or False", type=bool, default=True)
parser.add_argument("--dataset", help="locating or building", type=str, default="locating")
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
if dataset == "building":
    from data_loaders.building import building_dataloader, GDB_INFO
    question, _, country = building_dataloader(question_num, question_path = "./data/building/questions/simulated_questions.json")
    db_file_path = f"./data/building/db_query(parsed)/LPG_format/{country}.cql"
elif dataset == "locating":
    from data_loaders.locating  import locating_dataloader, GDB_INFO
    question, _, _ = locating_dataloader(question_num, "./data/locating/questions/standard/simulated_question.json", option=False)
    db_file_path = f"./data/locating/db_query(parsed)/LPG_format/q{question_num}.cql"
else:
    assert(0)

db_name = 'neo4j'
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

agent_option = args.agent
if agent_option == "dual":
    from techniques.PlanRAG.PlanRAG.multiAgents.dual.task_manager.base import TaskManagerChain as TaskManager
    from techniques.PlanRAG.PlanRAG.multiAgents.dual.data_collector.base import DataCollectorChain as DataCollector
    
    dc_llm = ChatOpenAI(temperature=0, model_name="gpt-4", max_retries=40)
    if args.use_memory:
        memory = ConversationBufferMemory(memory_key="history")
        human_message_template = "Previous histories: {history}\n\nRequirement: {input}\n\n{agent_scratchpad}"
        input_variables = ["history", "input", "agent_scratchpad"]
        dataCollector = DataCollector.from_llm_and_tools(llm=dc_llm, tools=databases, memory=memory, human_message_template=human_message_template, input_variables=input_variables, verbose=True)
    else:
        dataCollector = DataCollector.from_llm_and_tools(llm=dc_llm, tools=databases, verbose=True)

    tools = [
        Tool(
            name = "Data collector",
            func = dataCollector.run,
            description = """
            Useful for when you need to collect the data."""
        ),
    ]


elif agent_option == "tri":
    from techniques.PlanRAG.PlanRAG.multiAgents.tri.task_manager.base import TaskManagerChain as TaskManager
    from techniques.PlanRAG.PlanRAG.multiAgents.tri.data_collector.base import DataCollectorChain as DataCollector
    from techniques.PlanRAG.PlanRAG.multiAgents.tri.planner.base import PlannerChain as Planner
    from techniques.PlanRAG.PlanRAG.multiAgents.tri.plan_and_collect import PlanAndCollect
    
    dc_llm = ChatOpenAI(temperature=0, model_name="gpt-4", max_retries=40)
    if args.use_memory:
        memory = ConversationBufferMemory(memory_key="history")
        human_message_template = "{input}\n\n{agent_scratchpad}" # histories are handled within PlanAndCollect chain
        input_variables = ["input", "agent_scratchpad"]
        dataCollector = DataCollector.from_llm_and_tools(llm=dc_llm, tools=databases, memory=memory, human_message_template=human_message_template, input_variables=input_variables, verbose=True)
    else:
        dataCollector = DataCollector.from_llm_and_tools(llm=dc_llm, tools=databases, verbose=True)

    pl_llm = ChatOpenAI(temperature=0, model_name="gpt-4", max_retries=40)
    if args.use_memory:
        pl_memory = ConversationBufferMemory(memory_key="history")
        pl_human_message_template = "Previous histories: {history}\n\nQuestion: {input}\n\n{agent_scratchpad}"
        pl_input_variables = ["history", "input", "agent_scratchpad"]
        planner = Planner.from_llm_and_tools(llm=pl_llm, tools=databases, memory=pl_memory, human_message_template=pl_human_message_template, input_variables=pl_input_variables, gdb_info=GDB_INFO, verbose=True)
    else:
        planner = Planner.from_llm_and_tools(llm=pl_llm, tools=databases, gdb_info=GDB_INFO, verbose=True)

    planCollectChain = PlanAndCollect(planner = planner, dataCollector = dataCollector)

    tools = [
        Tool(
            name = "Data collector",
            func = planCollectChain.run,
            description = """
            Useful for when you need more data to answer the question."""
        )
    ]

tm_llm = ChatOpenAI(temperature=0, model_name="gpt-4", max_retries=40)
taskManager = TaskManager.from_llm_and_tools(llm=tm_llm, tools=tools, gdb_info=GDB_INFO, verbose=True)
taskManager.run(question)
