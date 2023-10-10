RDB_INFO = """
CREATE TABLE general(
    name    VARCHAR(30),
    current FLOAT,
    local_value FLOAT,
    outgoing FLOAT,
    value_added_outgoing FLOAT,
    retention_ FLOAT,
    total FLOAT,
    CONSTRAINT name PRIMARY KEY (name)
);
general table indicates node's general statistics.
1. retention_ means amount of money which is not go out from node (remaining money).
2. current means leftover of local_value (i.e. local_value-outgoing)
3. total means total trading power of each nodes.


CREATE TABLE trading(
    node_name       VARCHAR(30),
    country_code    VARCHAR(5),
    val FLOAT,
    CONSTRAINT country_code PRIMARY KEY (node_name, country_code)
);
general table indicates country's trading power on each node.
1. val means country_code's trading power on node_name.
RDB has no connection data
"""

GDB_INFO = """
(n:Trade_node {{name, local_value, node_inland, total_power, outgoing, ingoing}});
(m:Country {{name, trade_port, development}});

(Trade_node)-[r:UPSTREAM {{flow}}]->[Trade_node]
(Country)-[NodeCountry{{is_home, merchant,base_trading_power,calculated_trading_power}}]->(Trade_node)
"""

import json


# question starts with question number 1
def trading_dataloader(question_number, question_path = "./data/trading/questions/standard/questions.json", option=True):
    
    with open(question_path, 'r') as f:
        # question number starts with 1
        target_question= json.load(f)[question_number-1]
        
    f.close()

    if option:
        text_question = target_question["question"]+target_question['goal']+"""
        Here are possible options:
        """ 

        idx = 1
        for option in target_question["examples"]:
            text_question = text_question + f"{idx}: {option}\n"
            idx += 1
    else:
        text_question = target_question["question"]+target_question['goal']

    tabular_db_name = target_question["target_rdb"]
    graph_db_name = target_question["target_gdb"]

    return (text_question, tabular_db_name, graph_db_name)


if __name__ == "__main__":
    print(trading_dataloader(1)[0])