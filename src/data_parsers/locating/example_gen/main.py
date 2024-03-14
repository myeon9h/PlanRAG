import json
from parser import province_parser, country_parser, merchant_parser
from prompt_templete import situation, question, strategy, goal
import os
import pandas as pd



def json_example_generator(file_dir="./data/locating/questions/standard/questions.json", raw_dirs = ["./data/locating/raw/locating_raw.csv"]):
    global objective_country
    idx = 1
    example_list = []

    for raw_dir in raw_dirs:
        f = open(raw_dir, "r")
        df = pd.read_csv(f)
        question_and_answers = dict()
        
        for _, row in df.iterrows():
            question_and_answers[row["Country"]] = [row["Answer"]]
            
            

        
        savefile_path = "./data/locating/raw/"+raw_dir[-11:-4]+".eu4"
        print("savefile:", savefile_path)
        country_tradeprovince_dict = country_parser(savefile_path)
        province_node_dict = province_parser(savefile_path)
        situation_text = situation()
        for con in question_and_answers.keys():
            con_dict = dict()
            
            trade_port = country_tradeprovince_dict[con]["trade_port"]
            question_text = question(con, province_node_dict[trade_port], sorted(question_and_answers[con]))
            goal_text = goal(province_node_dict[trade_port])
            prompt = situation_text+question_text
            con_dict["question"] = prompt
            con_dict["goal"] = goal_text

            con_dict["answer"] = question_and_answers[con][0]
            con_dict["home"] = province_node_dict[trade_port]
            con_dict["country"] = con

            con_dict["target_rdb"] = "eu4_1445"
            con_dict["target_gdb"] = "eu4"
            con_dict["question_num"] = idx

            example_list.append(con_dict)
            idx = idx+1
            
    
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

    raw_dirs = ["./data/locating/raw/simulated_question_raw" + f for f in ["1445.csv", "1618.csv", "1701.csv"]]
    json_example_generator(file_dir="./data/locating/questions/standard/simulated_question.json", raw_dirs=raw_dirs)