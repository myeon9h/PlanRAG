# building data-loader
# building data are saved on ./data/building/questions/{type}.json

import json

# building question has one of following five types: {1,2,3}-hop, cycle, tree
# question number starts with 1
RDB_INFO = """
CREATE TABLE goods(    goods_name    VARCHAR(30),    code    INT,    base_price FLOAT,    current_price FLOAT,    pop_demand FLOAT, PRIMARY KEY (code));

CREATE TABLE building(    id INT,    name VARCHAR(80),    level INT, PRIMARY KEY (id));

CREATE TABLE supply(    goods_id INT,    building_id INT,    max_supply FLOAT,    current_output FLOAT,    level INT, PRIMARY KEY (goods_id, building_id));

CREATE TABLE demand(    goods_id INT,    building_id INT,    max_demand FLOAT,    current_input FLOAT,    level INT,   PRIMARY KEY (goods_id, building_id));
"""    

GDB_INFO = """
(g: Goods {{name, code, base_price, current_price, pop_demand}})
(b: Building {{id, name, level}})
(Goods)-[r:Demand{{max_demand, current_input}}]->(Building)
(Building)-[r:Supply{{max_supply, current_output}}]->(Goods)
"""


def building_dataloader(question_number, question_path = "./data/building/questions/simulated_questions.json"):

    with open(question_path, 'r') as f:
        # question number starts with 1
        json_data = json.load(f)
        target_question = None
        for q in json_data:
            if q["question_num"] == question_number:
                target_question = q
                break
        if target_question == None:
            print("no target question")
            exit()


    f.close()

    text_question = target_question["business_rules"]+"<Question>"+target_question["question"]

    graph_db_name = target_question["target_gdb"]

    country = target_question["country"]
    
    return (text_question,  graph_db_name, country)
    


if __name__ == "__main__":
    print(building_dataloader(1, "1-hop"))