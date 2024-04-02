import json
from parser import province_parser, country_parser, merchant_parser
from prompt_templete import business_rules, question, goal
import os
import pandas as pd

MAX_QUESTION_NUM = 100


def json_example_generator(file_dir="./data/locating/questions/standard/questions.json", raw_dirs = ["./data/locating/raw/locating_raw.csv"]):
    global objective_country
    idx = 1
    example_list = []

    for raw_dir in raw_dirs:
        f = open(raw_dir, "r")
        df = pd.read_csv(f)
        question_and_answers = dict()

        year = raw_dir[-8:-4]
        
        for _, row in df.iterrows():
            question_and_answers[row["Country"]] = [row["Answer"]]
            
            

        
        savefile_path = "./data/locating/raw/"+raw_dir[-11:-4]+".eu4"
        print("savefile:", savefile_path)
        country_tradeprovince_dict = country_parser(savefile_path)
        province_node_dict = province_parser(savefile_path)
        situation_text = business_rules()

        for con in question_and_answers.keys():

            if idx>MAX_QUESTION_NUM:
                break

            con_dict = dict()
            
            home_node = country_tradeprovince_dict[con]["home_node"]
            question_text = question(con, province_node_dict[home_node], year)
            goal_text = goal(province_node_dict[home_node])
            con_dict["business_rules"] = situation_text
            con_dict["question"] = question_text
            con_dict["goal"] = goal_text

            con_dict["answer"] = question_and_answers[con][0]
            con_dict["home"] = province_node_dict[home_node]
            con_dict["country"] = con
            con_dict["year"] = year

            con_dict["target_rdb"] = "eu4_1445"
            con_dict["target_gdb"] = "eu4"
            con_dict["question_num"] = idx

            example_list.append(con_dict)
            idx = idx+1
            
    
    file = open(file_dir, "w")
    json.dump(example_list, file, indent=4)
    file.close()
    return

def example_generator(indices, json_file_dir):
    
    with open(json_file_dir) as file:
        json_obj = json.load(file)
    
    
    prompt_list = []
    
    situation_text = business_rules()
    
    for idx in indices:
        problem = json_obj[idx]
        question_text = question(problem["country"], problem["homenode"],problem["year"])
        
        # prompt = situaton_text+strategy_text+question_text
        prompt = situation_text+question_text

        prompt_list.append(prompt)
        
        
    return prompt_list

if __name__ == "__main__":

    raw_dirs = ["./data/locating/raw/simulated_question_raw" + f for f in ["1445.csv", "1618.csv", "1701.csv"]]
    json_example_generator(file_dir="./data/locating/questions/standard/simulated_question.json", raw_dirs=raw_dirs)