# building data-loader
# building data are saved on ./data/building/questions/{type}.json

import json

# building question has one of following five types: {1,2,3}-hop, cycle, tree
# question number starts with 1





GDB_INFO = """
(g: Goods {{name, code, base_price, current_price, pop_demand}})
(b: Building {{id, name, level}})
(Goods)-[r:Demand{{max_demand, current_input}}]->(Building)
(Building)-[r:Supply{{max_supply, current_output}}]->(Goods)
"""


def building_dataloader(question_number, question_path = "./data/building/questions/simulated_questions.json"):

    with open(question_path, 'r') as f:
        # question number starts with 1
        target_question= json.load(f)[question_number-1]

    f.close()

    text_question = target_question["question"]

    graph_db_name = target_question["target_gdb"]

    country = target_question["country"]
    
    return (text_question,  graph_db_name, country)
    


if __name__ == "__main__":
    print(building_dataloader(1, "1-hop"))