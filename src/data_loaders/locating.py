RDB_INFO = """

CREATE TABLE country
(
    country_name    VARCHAR(30),
    trade_port    VARCHAR(30),
    development FLOAT,
   PRIMARY KEY (country_name)
);

CREATE TABLE trading_node
(
    trading_node    VARCHAR(30),
    local_value FLOAT,
    node_inland BOOLEAN
    total_power FLOAT,
    outgoing FLOAT,
    ingoing FLOAT,
   PRIMARY KEY (trading_node)
);

CREATE TABLE flow
(
    upstream    VARCHAR(30),
    downstream VARCHAR(30),
    flow FLOAT,
   PRIMARY KEY (upstream, downstream)
);

CREATE TABLE node_country
(
    node_name     VARCHAR(30),
    country_name    VARCHAR(30),
    is_home BOOLEAN,
    merchant BOOLEAN,
    base_trading_power FLOAT,
    calculated_trading_power FLOAT,
   PRIMARY KEY (node_name, country_name)
);
"""

GDB_INFO = """
(n:Trade_node {{name, local_value, node_inland, total_power, outgoing, ingoing}});
(m:Country {{name, trade_port, development}});

(Trade_node)-[r:UPSTREAM {{flow}}]->[Trade_node]
(Country)-[NodeCountry{{is_home, merchant,base_trading_power,calculated_trading_power}}]->(Trade_node)
"""

import json


# question starts with question number 1
def locating_dataloader(question_number, question_path = "./data/trading/questions/standard/questions.json", option=True):
    
    with open(question_path, 'r') as f:
        # question number starts with 1
        target_question= json.load(f)[question_number-1]
        
    f.close()

    text_question = target_question["business_rules"]+target_question["question"]+target_question['goal']

    if option:
        text_question = text_question+"""
        Here are possible options:
        """ 

        idx = 1
        for option in target_question["examples"]:
            text_question = text_question + f"{idx}: {option}\n"
            idx += 1

    tabular_db_name = target_question["target_rdb"]
    graph_db_name = target_question["target_gdb"]

    return (text_question, tabular_db_name, graph_db_name)


if __name__ == "__main__":
    print(locating_dataloader(1)[0])