import json
from prompt_templete import question, business_rules
import os
import pandas as pd



def json_example_generator(file_dir="./data/building/questions/simulated_questions.json", raw_dir = "./data/building/raw/simulated_question_raw.csv"):
    
    f = open(raw_dir, "r")
    df = pd.read_csv(f)
    example_and_answers = []
    
    for _, row in df.iterrows():
        example_and_answers.append([row["Country"],row["Goods_to_Minimize"], row["Answer_id"]])
        
    
    example_list = []
    idx = 1
    for example in example_and_answers:
        con = example[0]
        con_dict = dict()
        
        con_dict["country"] = con
        con_dict["question_num"] = idx
        con_dict["question"] = question(example[1])
        con_dict["business_rules"] = business_rules()
        con_dict["goods"] = example[1]
        con_dict["target_gdb"] = "gdb-2hop-001"
        con_dict["answer"] = example[2]

        example_list.append(con_dict)
        idx = idx+1
    
    file = open(file_dir, "w")
    
    json.dump(example_list, file, indent=4)
    
    file.close()
    return


if __name__ == "__main__":
    json_example_generator()
