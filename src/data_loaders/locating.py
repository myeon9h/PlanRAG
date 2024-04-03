RDB_INFO = """

CREATE TABLE country
(
    country_name    VARCHAR(30),
    home_node    VARCHAR(30),
    development FLOAT,
   PRIMARY KEY (country_name)
);

CREATE TABLE trade_node
(
    trade_node    VARCHAR(30),
    local_value FLOAT,
    is_inland BOOLEAN
    total_power FLOAT,
    outgoing FLOAT,
    ingoing FLOAT,
   PRIMARY KEY (trade_node)
);

CREATE TABLE flow
(
    source    VARCHAR(30),
    dest VARCHAR(30),
    flow FLOAT,
   PRIMARY KEY (source, dest)
);

CREATE TABLE node_country
(
    trade_node     VARCHAR(30),
    country_name    VARCHAR(30),
    is_home BOOLEAN,
    has_merchant BOOLEAN,
    base_trading_power FLOAT,
    calculated_trading_power FLOAT,
   PRIMARY KEY (trade_node, country_name)
);
"""

GDB_INFO = """
(n:Trade_node {{name, local_value, is_inland, total_power, outgoing, ingoing}});
(m:Country {{name, home_node, development}});

(Trade_node)-[r:source {{flow}}]->[Trade_node]
(Country)-[NodeCountry{{is_home, has_merchant,base_trading_power,calculated_trading_power}}]->(Trade_node)
"""

import json


# question starts with question number 1
def locating_dataloader(question_number, question_path = "./data/trading/questions/questions.json", option=True):
    
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