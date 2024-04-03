import json
from prompt_templete import question, business_rules
import os
import pandas as pd

MAX_QUESTION_NUM=101

def eliminate_multianswers():
    import tqdm
    import csv
    with open("./data/building/questions/simulated_questions.json", 'r') as f:
        d = json.load(f)
    
    with open('./data/building/raw/two_or_more_answers_simulated_questions_raw.csv') as f:
        reader = csv.reader(f)
        l = [row for row in reader]
    
    
    # print(l)
    
    l_idx = 1

    new_d = []

    for q in tqdm.tqdm(d):
        if len(new_d) >=MAX_QUESTION_NUM:
            break

        if l_idx >= len(l):
            new_d.append(q)
            continue

        
        if q['country'] == l[l_idx][1] and q["goods"] == l[l_idx][2]:
            # print(q["question_num"])
            l_idx = l_idx + 1
                
        else:
            new_d.append(q)
            # print(len(new_d))


    with open("./data/building/questions/simulated_questions.json", 'w') as f:
        json.dump(new_d, f, indent=4)
    



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
    eliminate_multianswers()
