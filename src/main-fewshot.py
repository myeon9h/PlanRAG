import os
import pandas as pd
import json

from langchain.agents import Tool
from langchain.chat_models import ChatOpenAI

from utils import Neo4jDatabase
from utils import SQLDatabase
from tqdm import tqdm
import argparse


def fewshot_loader(technique, scenario, database_type):

    if technique == "PlanRAG_fewshot" and scenario == "locating" and database_type == "relational":
        return """
<few-shot example question>
Assume that you are the ruler of the country named \"TUR\". You and your competitions are on the system of trade in 1444.\nYou have one merchant to work on trade system. Our home node is \"constantinople\". where should I allocate my merchant to steer trade to \"constantinople\"?\n

Note that my goal is maximizing my profit on \"constantinople\".

Plan: 
[Step 1: Identify the trading nodes that are source of the "english_channel". 
 Step 2: Calculate the potential profit increase for each of these nodes if a merchant is placed there. 
 Step 3: Identify the node with the highest potential profit increase.]

Current step: Step 1
Thought: To identify the trading nodes that are source of the "english_channel", I need to query the "flow" table in the relational database.
Action: Relational DB
Action input: SELECT source FROM flow WHERE dest = 'english_channel';
Observation:
         source
0       champagne
1  chesapeake_bay
2     ivory_coast
3          lubeck
4       north_sea
Re-plan: N
Current step: Step 2
Thought: To calculate the potential profit increase for each of these nodes if a merchant is placed there, I need to consider several factors. These include the local value and ingoing of the node, the base trading power of ENG in the node, the total trading power of the node, and the development of ENG. I need to query the "trade_node" and "node_country" tables in the relational database.
Action: Relational DB
Action input: SELECT t.trade_node, t.local_value, t.ingoing, t.total_power, n.base_trading_power, c.development FROM trade_node t JOIN node_country n ON t.trade_node = n.trade_node JOIN country c ON n.country_name = c.country_name WHERE n.country_name = 'ENG' AND t.trade_node IN ('champagne', 'chesapeake_bay', 'ivory_coast', 'lubeck', 'north_sea');

Observation:
  trade_node  local_value  ...  base_trading_power  development
0    champagne        7.497  ...              87.799      315.602
1       lubeck        5.818  ...              38.179      315.602
2    north_sea        4.317  ...              51.979      315.602

[3 rows x 6 columns]
Re-plan: Y
New Plan: 
[Step 1: Identify the trading nodes that are source of the "english_channel". 
 Step 2: Calculate the potential profit increase for each of these nodes if a merchant is placed there. 
 Step 3: Identify the node with the highest potential profit increase.
 Step 4: Check if the nodes are inland or not.]

Current step: Step 4
Thought: To check if the nodes are inland or not, I need to query the "trade_node" table in the relational database.
Action: Relational DB
Action input: SELECT trade_node, node_inland FROM trade_node WHERE trade_node IN ('champagne', 'lubeck', 'north_sea');

Observation:
  trade_node  node_inland
0    champagne            1
1       lubeck            0
2    north_sea            0
Re-plan: N
Current step: Step 2
Thought: Now that I know which nodes are inland, I can calculate the potential profit increase for each of these nodes if a merchant is placed there. The calculation will be different for inland nodes due to the added value changing to 2+max(development/3, 50). I will use the formula (local_value+ingoing)*(country_trading_power/total_trading_power) to calculate the potential profit increase.
Action: Self thinking
Action input: Calculate the potential profit increase for each node.

Observation:
champagne: (7.497+0)*(87.799+2+max(315.602/3, 50))/(87.799+7.497) = 1.05*(7.497+0)*(87.799+2+105.2)/(87.799+7.497) = 1.05*7.497*(195.0)/(95.296) = 16.5
lubeck: (5.818+0)*(38.179+2)/(38.179+5.818) = 1.05*(5.818+0)*(40.179)/(43.997) = 5.5
north_sea: (4.317+0)*(51.979+2)/(51.979+4.317) = 1.05*(4.317+0)*(53.979)/(56.296) = 4.1
Re-plan: N
Current step: Step 3
Thought: Now that I have calculated the potential profit increase for each node, I can identify the node with the highest potential profit increase.
Action: Self thinking
Action input: Identify the node with the highest potential profit increase.


Observation:
The node with the highest potential profit increase is "champagne" with a potential profit increase of 16.5.
Re-plan: N
Thought: I now know the answer.
Final answer: The merchant should be allocated to the "champagne" trading node to maximize profit on the "english_channel".
    """

    elif technique == "PlanRAG_fewshot" and scenario == "building" and database_type == "relational":
        return """
<few-shot example question>
Which building id should we increase a level by 5 to maximally decrease the market price of tools?

Plan: [Step 1: Retrieve the code for the goods named 'tools', Step 2: Retrieve all building ids that supply 'tools', Step 3: For each building id, calculate the new current_output if the level is increased by 5, Step 4: For each building id, calculate the new supply of 'tools' if the level is increased by 5, Step 5: For each building id, calculate the new demand of 'tools', Step 6: For each building id, calculate the new current_price of 'tools' if the level is increased by 5, Step 7: Compare the new current_prices and find the building id that leads to the maximum decrease in the current_price of 'tools'].
Current step: Step 1
Thought: I need to find the code for the goods named 'tools' in order to use it in the subsequent steps.
Action: Relational DB
Action input: SELECT code FROM goods WHERE goods_name = 'tools';
Observation:
   code
0    33
Plan: [Step 1: Retrieve the code for the goods named 'tools', Step 2: Retrieve all building ids that supply 'tools', Step 3: For each building id, calculate the new current_output if the level is increased by 5, Step 4: For each building id, calculate the new supply of 'tools' if the level is increased by 5, Step 5: For each building id, calculate the new demand of 'tools', Step 6: For each building id, calculate the new current_price of 'tools' if the level is increased by 5, Step 7: Compare the new current_prices and find the building id that leads to the maximum decrease in the current_price of 'tools'].
Current step: Step 2
Thought: Now that I have the code for 'tools', I can use it to find all the building ids that supply 'tools'.
Action: Relational DB
Action input: SELECT building_id FROM supply WHERE goods_id = 33;
Observation:
   building_id
0          892
Re-plan: N
Plan: [Step 1: Retrieve the code for the goods named 'tools', Step 2: Retrieve all building ids that supply 'tools', Step 3: For each building id, calculate the new current_output if the level is increased by 5, Step 4: For each building id, calculate the new supply of 'tools' if the level is increased by 5, Step 5: For each building id, calculate the new demand of 'tools', Step 6: For each building id, calculate the new current_price of 'tools' if the level is increased by 5, Step 7: Compare the new current_prices and find the building id that leads to the maximum decrease in the current_price of 'tools'].
Current step: Step 3
Thought: Now that I have the building id that supplies 'tools', I need to calculate the new current_output if the level of this building is increased by 5. This requires the current level of the building, the max_supply of the supply relation, and the current_input and max_demand of the demand relation.
Action: Relational DB
Action input: SELECT s.max_supply, d.current_input, d.max_demand FROM supply s JOIN demand d ON s.building_id = d.building_id WHERE s.building_id = 892 AND s.goods_id = 33 AND d.goods_id = 33;

Observation:
Empty DataFrame
Columns: [max_supply, current_input, max_demand]
Index: []
Re-plan: Y
Plan: [Step 1: Retrieve the code for the goods named 'tools', Step 2: Retrieve all building ids that supply 'tools', Step 3: For each building id, calculate the new current_output if the level is increased by 5, Step 4: For each building id, calculate the new supply of 'tools' if the level is increased by 5, Step 5: For each building id, calculate the new demand of 'tools', Step 6: For each building id, calculate the new current_price of 'tools' if the level is increased by 5, Step 7: Compare the new current_prices and find the building id that leads to the maximum decrease in the current_price of 'tools'].
Current step: Step 3
Thought: The previous query returned an empty result, which means that the building with id 892 does not have a demand for 'tools'. This is strange because a building that supplies a good should also have a demand for it. I need to check the data again.
Action: Relational DB
Action input: SELECT * FROM demand WHERE building_id = 892 AND goods_id = 33; 

Observation:
Empty DataFrame
Columns: [goods_id, building_id, max_demand, current_input, level]
Index: []
Re-plan: Y
Plan: [Step 1: Retrieve the code for the goods named 'tools', Step 2: Retrieve all building ids that supply 'tools', Step 3: For each building id, calculate the new current_output if the level is increased by 5, Step 4: For each building id, calculate the new supply of 'tools' if the level is increased by 5, Step 5: For each building id, calculate the new demand of 'tools', Step 6: For each building id, calculate the new current_price of 'tools' if the level is increased by 5, Step 7: Compare the new current_prices and find the building id that leads to the maximum decrease in the current_price of 'tools'].
Current step: Step 3
Thought: The previous query returned an empty result, which means that the building with id 892 does not have a demand for 'tools'. This is strange because a building that supplies a good should also have a demand for it. I need to check the data again.
Action: Relational DB
Action input: SELECT * FROM supply WHERE building_id = 892 AND goods_id = 33; 

Observation:
   goods_id  building_id  max_supply  current_output  level
0        33          892       180.0             3.0    103
Re-plan: N
Plan: [Step 1: Retrieve the code for the goods named 'tools', Step 2: Retrieve all building ids that supply 'tools', Step 3: For each building id, calculate the new current_output if the level is increased by 5, Step 4: For each building id, calculate the new supply of 'tools' if the level is increased by 5, Step 5: For each building id, calculate the new demand of 'tools', Step 6: For each building id, calculate the new current_price of 'tools' if the level is increased by 5, Step 7: Compare the new current_prices and find the building id that leads to the maximum decrease in the current_price of 'tools'].
Current step: Step 3
Thought: The building with id 892 does supply 'tools', but it does not demand them. This means that the building produces 'tools' but does not consume them. Therefore, the current_output of the supply relation can be calculated without considering the demand relation. The new current_output can be calculated as the average ratio of the current_input to the max_demand, multiplied by the max_supply. However, since there is no demand relation, the current_input and max_demand are both 0, which makes the ratio undefined. Therefore, the new current_output is simply the max_supply.
Action: Self thinking
Action input: The new current_output is the max_supply, which is 180.0.

Observation:
The new current_output is 180.0.
Re-plan: N
Plan: [Step 1: Retrieve the code for the goods named 'tools', Step 2: Retrieve all building ids that supply 'tools', Step 3: For each building id, calculate the new current_output if the level is increased by 5, Step 4: For each building id, calculate the new supply of 'tools' if the level is increased by 5, Step 5: For each building id, calculate the new demand of 'tools', Step 6: For each building id, calculate the new current_price of 'tools' if the level is increased by 5, Step 7: Compare the new current_prices and find the building id that leads to the maximum decrease in the current_price of 'tools'].
Current step: Step 4
Thought: Now that I have the new current_output, I can calculate the new supply of 'tools' if the level of the building is increased by 5. The supply of a good is defined by the sum of the current_output of all supplies connected to the good. Since the building with id 892 is the only one that supplies 'tools', the new supply is simply the new current_output.
Action: Self thinking
Action input: The new supply of 'tools' is the new current_output, which is 180.0.

Observation:
The new supply of 'tools' is 180.0.
Re-plan: N
Plan: [Step 1: Retrieve the code for the goods named 'tools', Step 2: Retrieve all building ids that supply 'tools', Step 3: For each building id, calculate the new current_output if the level is increased by 5, Step 4: For each building id, calculate the new supply of 'tools' if the level is increased by 5, Step 5: For each building id, calculate the new demand of 'tools', Step 6: For each building id, calculate the new current_price of 'tools' if the level is increased by 5, Step 7: Compare the new current_prices and find the building id that leads to the maximum decrease in the current_price of 'tools'].
Current step: Step 5
Thought: Now that I have the new supply of 'tools', I need to calculate the new demand of 'tools'. The demand of a good is defined as the good's pop_demand plus the sum of the max_demand of all demands connected to the good. Since the building with id 892 does not have a demand for 'tools', the new demand is simply the pop_demand of 'tools'.
Action: Relational DB
Action input: SELECT pop_demand FROM goods WHERE code = 33;

Observation:
   pop_demand
0         0.0
Re-plan: N
Plan: [Step 1: Retrieve the code for the goods named 'tools', Step 2: Retrieve all building ids that supply 'tools', Step 3: For each building id, calculate the new current_output if the level is increased by 5, Step 4: For each building id, calculate the new supply of 'tools' if the level is increased by 5, Step 5: For each building id, calculate the new demand of 'tools', Step 6: For each building id, calculate the new current_price of 'tools' if the level is increased by 5, Step 7: Compare the new current_prices and find the building id that leads to the maximum decrease in the current_price of 'tools'].
Current step: Step 5
Thought: The pop_demand for 'tools' is 0.0. Since there are no other buildings that demand 'tools', the new demand for 'tools' is also 0.0.
Action: Self thinking
Action input: The new demand for 'tools' is 0.0.

[0m
Observation:[33;1m[1;3m[0m
[32;1m[1;3mThe new demand for 'tools' is 0.0.
Re-plan: N
Plan: [Step 1: Retrieve the code for the goods named 'tools', Step 2: Retrieve all building ids that supply 'tools', Step 3: For each building id, calculate the new current_output if the level is increased by 5, Step 4: For each building id, calculate the new supply of 'tools' if the level is increased by 5, Step 5: For each building id, calculate the new demand of 'tools', Step 6: For each building id, calculate the new current_price of 'tools' if the level is increased by 5, Step 7: Compare the new current_prices and find the building id that leads to the maximum decrease in the current_price of 'tools'].
Current step: Step 6
Thought: Now that I have the new supply and demand for 'tools', I can calculate the new current_price of 'tools' if the level of the building is increased by 5. The current_price of a good is determined by base_price*(1+0.75*(demand-supply)/max(demand,supply)). Since the new demand is 0.0 and the new supply is 180.0, the new current_price is determined by the base_price of 'tools'.
Action: Relational DB
Action input: SELECT base_price FROM goods WHERE code = 33;


Observation:
   base_price
0        40.0
Re-plan: N
Plan: [Step 1: Retrieve the code for the goods named 'tools', Step 2: Retrieve all building ids that supply 'tools', Step 3: For each building id, calculate the new current_output if the level is increased by 5, Step 4: For each building id, calculate the new supply of 'tools' if the level is increased by 5, Step 5: For each building id, calculate the new demand of 'tools', Step 6: For each building id, calculate the new current_price of 'tools' if the level is increased by 5, Step 7: Compare the new current_prices and find the building id that leads to the maximum decrease in the current_price of 'tools'].
Current step: Step 6
Thought: The base_price for 'tools' is 40.0. Since the new demand is 0.0 and the new supply is 180.0, the new current_price is determined by the base_price, which is 40.0.
Action: Self thinking
Action input: The new current_price for 'tools' is 40.0.


[0m
Observation:[33;1m[1;3m[0m
[32;1m[1;3mThe new current_price for 'tools' is 40.0.
Re-plan: N
Plan: [Step 1: Retrieve the code for the goods named 'tools', Step 2: Retrieve all building ids that supply 'tools', Step 3: For each building id, calculate the new current_output if the level is increased by 5, Step 4: For each building id, calculate the new supply of 'tools' if the level is increased by 5, Step 5: For each building id, calculate the new demand of 'tools', Step 6: For each building id, calculate the new current_price of 'tools' if the level is increased by 5, Step 7: Compare the new current_prices and find the building id that leads to the maximum decrease in the current_price of 'tools'].
Current step: Step 7
Thought: Now that I have the new current_price for 'tools', I can compare it with the old current_price to find the decrease in the current_price. If the new current_price is lower than the old current_price, then the building id that leads to this decrease is the one that should be increased by 5 levels.
Action: Relational DB
Action input: SELECT current_price FROM goods WHERE code = 33;



Observation:
   current_price
0         56.958
Re-plan: N
Plan: [Step 1: Retrieve the code for the goods named 'tools', Step 2: Retrieve all building ids that supply 'tools', Step 3: For each building id, calculate the new current_output if the level is increased by 5, Step 4: For each building id, calculate the new supply of 'tools' if the level is increased by 5, Step 5: For each building id, calculate the new demand of 'tools', Step 6: For each building id, calculate the new current_price of 'tools' if the level is increased by 5, Step 7: Compare the new current_prices and find the building id that leads to the maximum decrease in the current_price of 'tools'].
Current step: Step 7
Thought: The old current_price for 'tools' is 56.958. The new current_price is 40.0, which is lower than the old current_price. Therefore, the building id that leads to this decrease in the current_price is the one that should be increased by 5 levels.
Action: Self thinking
Action input: The building id that should be increased by 5 levels to maximally decrease the market price of tools is 892.

Observation:
The building id that should be increased by 5 levels to maximally decrease the market price of tools is 892.
Re-plan: N
Thought: I now know the answer.
Final answer: The building id that should be increased by 5 levels to maximally decrease the market price of tools is 892.

"""

    elif technique == "IterRAG_fewshot" and scenario == "locating" and database_type == "relational":
        return """
<few-shot example question>
Assume that you are the ruler of the country named \"ENG\". You and your competitions are on the system of trade in 1444.\nYou have one merchant to work on trade system. Our home node is \"english_channel\". where should I allocate my merchant to steer trade to \"english_channel\"?

Note that my goal is maximizing my profit on \"english_channel\".

Thought: 
To answer this question, I need to find the trading node that will maximize the profit for the country "ENG" if a merchant is placed there. The profit is proportional to the local value and ingoing of the node, and the ratio of the country's trading power to the total trading power of the node. The merchant increases the trading power of the country's trading node by 2 and amplifies it by 1.05 times. If the node is inland, the added value changes to 2+max(development/3, 50). 

First, I need to find the trading nodes that are source of the home node "english_channel". Then, I need to calculate the potential profit for each of these nodes if a merchant is placed there. The node with the highest potential profit is the one where the merchant should be placed.

Action: Relational DB
Action input: 
SELECT source FROM flow WHERE dest = 'english_channel';
Observation:
         source
0       champagne
1  chesapeake_bay
2     ivory_coast
3          lubeck
4       north_sea
Thought: 
Now I have the list of source nodes of "english_channel". I need to calculate the potential profit for each of these nodes if a merchant is placed there. The profit is proportional to the local value and ingoing of the node, and the ratio of the country's trading power to the total trading power of the node. The merchant increases the trading power of the country's trading node by 2 and amplifies it by 1.05 times. If the node is inland, the added value changes to 2+max(development/3, 50). 

Action: Relational DB
Action input: 
SELECT t.trade_node, t.local_value, t.ingoing, t.total_power, t.node_inland, n.base_trading_power, n.calculated_trading_power, c.development
FROM trade_node t
JOIN node_country n ON t.trade_node = n.trade_node
JOIN country c ON n.country_name = c.country_name
WHERE t.trade_node IN ('champagne', 'chesapeake_bay', 'ivory_coast', 'lubeck', 'north_sea') AND n.country_name = 'ENG';

Observation:
  trade_node  local_value  ...  calculated_trading_power  development
0    champagne        7.497  ...                    87.799      315.602
1       lubeck        5.818  ...                    38.179      315.602
2    north_sea        4.317  ...                    51.979      315.602

[3 rows x 8 columns]
Thought: 
Now I have the necessary data to calculate the potential profit for each of the source nodes of "english_channel". The profit is proportional to the local value and ingoing of the node, and the ratio of the country's trading power to the total trading power of the node. The merchant increases the trading power of the country's trading node by 2 and amplifies it by 1.05 times. If the node is inland, the added value changes to 2+max(development/3, 50). 

Action: Self thinking
Action input: 
Calculate the potential profit for each node:
- champagne: (7.497+0)*(87.799+2*1.05)/(87.799+2) = 7.497
- lubeck: (5.818+0)*(38.179+2*1.05)/(38.179+2) = 5.818
- north_sea: (4.317+0)*(51.979+2*1.05)/(51.979+2) = 4.317

Observation:
The potential profit for each node is as follows:
- champagne: 7.497
- lubeck: 5.818
- north_sea: 4.317

Thought: 
Now I know the potential profit for each of the source nodes of "english_channel". The node with the highest potential profit is the one where the merchant should be placed.

Final answer: 
The merchant should be placed at the "champagne" node to maximize the profit on "english_channel".
"""
    
    elif technique == "IterRAG_fewshot" and scenario == "building" and database_type == "relational":
        return """
<few-shot example question>
Question: Which building id should we increase a level by 5 to maximally decrease the market price of hardwood?

Thought: To answer this question, we need to find out which building's level increase will lead to the maximum decrease in the market price of hardwood. This means we need to find out which building, when its level is increased, will lead to the highest increase in the supply of hardwood, thus decreasing its market price. 

First, we need to identify the code of hardwood from the goods table. Then, we need to find out which buildings are connected to hardwood in the supply table. After that, we need to calculate the potential increase in supply for each building when its level is increased by 5. The building that leads to the highest increase in supply will be the one we are looking for.

Action: Relational DB
Action input: SELECT code FROM goods WHERE goods_name = 'hardwood';
Observation:
   code
0    26
Thought: Now that we have the code for hardwood, we can use it to find out which buildings are connected to hardwood in the supply table. We also need to calculate the potential increase in supply for each building when its level is increased by 5. 

Action: Relational DB
Action input: SELECT building_id, max_supply, level FROM supply WHERE goods_id = 26;

Observation:
   building_id  max_supply  level
0          136        30.0      2
Thought: Now that we have the building id, max_supply, and level for the building that supplies hardwood, we can calculate the potential increase in supply if the level of the building is increased by 5. The potential increase in supply is calculated as the difference between the max_supply at the new level and the max_supply at the current level. Since the max_supply and level have a proportional relationship, we can assume that the max_supply will increase by the same factor as the level. 

Action: Self thinking
Action input: Calculate the potential increase in supply for the building with id 136 if its level is increased by 5.

Observation:
Potential increase in supply = max_supply * (new level / current level) - max_supply
                             = 30.0 * (7 / 2) - 30.0
                             = 75.0
Thought: The potential increase in supply for the building with id 136 if its level is increased by 5 is 75.0. This is the building that we should increase a level by 5 to maximally decrease the market price of hardwood.

Final answer: The building id that we should increase a level by 5 to maximally decrease the market price of hardwood is 136.
"""
    
    else:
        return ""


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
    parser.add_argument("--device", type=int, default=0)
    parser.add_argument("--model", type=str, default="gpt-4")
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

        fewshot_question = question.split("<Question>")[0]+fewshot_loader(args.technique, scenario, database_type)+question.split("<Question>")[1]


    elif scenario == "locating":
        from data_loaders.locating  import locating_dataloader, GDB_INFO, RDB_INFO
        question, _, _ = locating_dataloader(question_num, "./data/locating/questions/standard/simulated_question.json", option=False)
        fewshot_question = question.split("<Question>")[0]+fewshot_loader(args.technique, scenario, database_type)+question.split("<Question>")[1]


    else:
        assert(0)


    if database_type == "graph":
        db_name = "dqardb"
        db_config = config['NEO4J']
        db_engine = Neo4jDatabase(host=db_config['HOST'], user=db_config['USER'], password=db_config['PASSWORD'], database=db_name)

        tool_name = "Graph DB"
        tool_description = """Useful for when you need to collect the data that follows the following schema (You MUST generate a Cypher query statement to interact with this tool):""" + GDB_INFO

        if scenario == "building":
            db_file_path = f"./data/{scenario}/db_query(parsed)/LPG_format/{country}.cql"
        elif scenario == "locating":
            db_file_path = f"./data/{scenario}/db_query(parsed)/LPG_format/q{question_num}.cql"

    elif database_type == "relational":
        db_name = "eu4_1445"
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
    elif technique == "IterRAG_fewshot":
        from techniques.IterRAG.base import TaskManagerChain as TaskManager
        question = fewshot_question
    elif technique == "PlanRAG":
        from techniques.PlanRAG.PlanRAG.base import TaskManagerChain as TaskManager
    elif technique == "PlanRAG_woReplan":
        from techniques.PlanRAG.PlanRAG_woReplan.base import TaskManagerChain as TaskManager
    elif technique == "PlanRAG_fewshot":
        from techniques.PlanRAG.PlanRAG.base import TaskManagerChain as TaskManager
        question = fewshot_question
    else:
        assert(0)

    # llm = ChatOpenAI(temperature=0, model_name="gpt-4", max_retries=40)
    os.environ["HUGGINGFACEHUB_API_TOKEN"] = config['HUGGINGFACEHUB_API_TOKEN']

    # from langchain_community.llms import HuggingFaceHub
    # from langchain_community.chat_models.huggingface import ChatHuggingFace
    # repo_id = "mistralai/Mixtral-8x7B-Instruct-v0.1"
    # llm = HuggingFaceHub(
    #     repo_id="HuggingFaceH4/zephyr-7b-beta",
    #     task="text-generation",
    # )

    # from langchain.llms import HumanInputLLM



    from langchain.llms.huggingface_pipeline import HuggingFacePipeline
    from langchain_community.llms import HuggingFaceHub
    from langchain_community.chat_models.huggingface import ChatHuggingFace

    # server_url = "https://localhost:3000"
    # llm = OpenLLM(server_url=server_url)
    # llm = Ollama(model = "phi", temperature = 0)
    # llm = HumanInputLLM()
    if "gpt" in args.model:
        llm = ChatOpenAI(temperature=0, model_name="gpt-4", max_retries=40)
    else:
        llm =  HuggingFacePipeline.from_model_id(
        # model_id="meta-llama/Llama-2-13b-hf",
        model_id = args.model,
        task="text-generation",
        pipeline_kwargs={"temperature": 0.1, "max_length": 2048},
        device = args.device
        )

    

    taskManager = TaskManager.from_llm_and_tools(llm=llm, tools=databases, verbose = True)
    taskManager.run(question)
