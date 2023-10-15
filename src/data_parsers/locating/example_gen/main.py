import json
from parser import province_parser, country_parser, merchant_parser
from prompt_templete import situation, question, strategy, goal
import os
import pandas as pd



def json_example_generator(file_dir="./data/locating/questions/standard/questions.json", raw_dir = "./data/locating/raw/locating_raw.csv"):
    global objective_country
    
    f = open(raw_dir, "r")
    df = pd.read_csv(f)
    example_and_answers = dict()
    
    for _, row in df.iterrows():
        example_and_answers[row["Country"]] = [row["Answer"], row["Example 1"], row["Example 2"], row["Example 3"]]
        
        
    example_list = []
    year = 1445
    
    country_tradeprovince_dict = country_parser()
    province_node_dict = province_parser()
    # print(province_node_dict)
    situation_text = situation()
    idx = 1
    for con in example_and_answers.keys():
        con_dict = dict()
        
        trade_port = country_tradeprovince_dict[con]["trade_port"]
        # print(trade_port) 
        # print(con)
        # print(province_node_dict[trade_port])
        # print(example_and_answers[con])
        question_text = question(con, province_node_dict[trade_port], sorted(example_and_answers[con]))
        goal_text = goal(province_node_dict[trade_port])
        prompt = situation_text+question_text
        con_dict["question"] = prompt
        con_dict["year"] = year
        con_dict["goal"] = goal_text

        con_dict["answer"] = example_and_answers[con][0]
        con_dict["examples"] = sorted(example_and_answers[con])
        con_dict["home"] = province_node_dict[trade_port]
        con_dict["country"] = con

        con_dict["target_rdb"] = "eu4_1445"
        con_dict["target_gdb"] = "eu4"
        con_dict["question_num"] = idx

        example_list.append(con_dict)
        idx = idx+1
        
    # json_text = json.dumps(example_list)
    
    file = open(file_dir, "w")
    
    json.dump(example_list, file, indent=4)
    
    file.close()
    return

def example_generator(indices, json_file_dir="./data/locating/questions/example.json"):
    
    with open(json_file_dir) as file:
        json_obj = json.load(file)
    
    
    prompt_list = []
    
    situation_text = situation()
    
    for idx in indices:
        problem = json_obj[idx]
        question_text = question(problem["country"], problem["homenode"], problem["examples"])
        
        # prompt = situaton_text+strategy_text+question_text
        prompt = situation_text+question_text

        prompt_list.append(prompt)
        
        
    return prompt_list

if __name__ == "__main__":
    json_example_generator(file_dir="./data/locating/questions/standard/simulated_question.json", raw_dir="./data/locating/raw/simulated_question_raw.csv")
    # example_generator([i for i in range(len(objective_country))])    