import building
import country
import goods
from tqdm import tqdm 
import copy
import pandas as pd


def initialize(country_code, file_path = "./data/building/raw/test.v3", goods_file_path = "./data/building/raw/goods/00_goods.txt"):

    try:
        cnt = country.country_extracting(file_path, country_code)
    except:
        return (None, None, None)
    goods_list = initialize_goods(cnt, goods_file=goods_file_path)
    building_dict = initialize_buildings(cnt, file_path=file_path, goods_file_path=goods_file_path)

    return (cnt, goods_list, building_dict)


def initialize_goods(cnt:country.Country, goods_file = "./data/building/raw/goods/00_goods.txt"):
    goods_list = goods.goods_finder(goods_file)
    for goods_code in range(len(goods_list)):
        # demand by pops
        goods_list[goods_code].pop_demand = (cnt.consume_by_pops[goods_code] if goods_code in cnt.consume_by_pops.keys()  else 0)
        # [goods_code] = 0


    return goods_list

def initialize_buildings(cnt:country.Country, file_path = "./data/building/raw/test.v3", goods_file_path = "./data/building/raw/goods/00_goods.txt"):
    

    building_dict = building.extract_building(file_path=file_path)

    filtered_building_dict = dict()

    for bidx in building_dict.keys():
        if building_dict[bidx].state in cnt.states:
            filtered_building_dict[bidx] = building_dict[bidx]
    return filtered_building_dict

def modification(building_dict, id, mod_level):
    building_dict[id].level_change(building_dict[id].level+mod_level)
    return building_dict

def extract_cql(goods_list, building_dict):
    query = ""

    for g in goods_list:
        query = query + g.lpg_format()

    for b in building_dict.values():
        query = query + b.lpg_format()

    return query

def extract_sql(goods_list, building_dict):
    query = ""

    # table init
    query = query +"""
  
CREATE TABLE goods(    goods_name    VARCHAR(30),    code    INT,    base_price FLOAT,    current_price FLOAT,    pop_demand FLOAT, PRIMARY KEY (code));

CREATE TABLE building(    id INT,    name VARCHAR(80),    level INT, PRIMARY KEY (id));

CREATE TABLE supply(    goods_id INT,    building_id INT,    max_supply FLOAT,    current_output FLOAT,    level INT, PRIMARY KEY (goods_id, building_id));

CREATE TABLE demand(    goods_id INT,    building_id INT,    max_demand FLOAT,    current_input FLOAT,    level INT,   PRIMARY KEY (goods_id, building_id));
    
"""

    for g in goods_list:
        query = query + g.sql_format()

    for b in building_dict.values():
        query = query + b.sql_format()

    return query

def simulate(goods_list, building_dict, cycle = 10):

    for b in building_dict.values():
        for goods_code in b.max_demand.keys():
            goods_list[goods_code].building_demand = goods_list[goods_code].building_demand + b.max_demand[goods_code]
        for goods_code in b.max_supply.keys():
            goods_list[goods_code].supply = goods_list[goods_code].supply + b.max_supply[goods_code]



    for i in range(cycle):

        for bidx in building_dict.keys():
            for goods_code in building_dict[bidx].max_demand.keys():

                building_dict[bidx].current_input[goods_code] = building_dict[bidx].max_demand[goods_code]*goods_list[goods_code].supply/(goods_list[goods_code].pop_demand + goods_list[goods_code].building_demand)


        for goods in goods_list:
            goods.supply = 0
        for b in building_dict.values():
            b.current_output_calculation()
            for goods_code in b.current_output.keys():
                goods_list[goods_code].supply = goods_list[goods_code].supply + b.current_output[goods_code]
        


    for g in goods_list:
        g.price_calculate()

    return goods_list, building_dict


if __name__ == "__main__":

    cql_dir = "./data/building/db_query(parsed)/LPG_format/"
    sql_dir = "./data/building/db_query(parsed)/SQL_format/"
    raw_dir = "./data/building/raw/simulated_question_raw.csv"
    non_filtered_questions_raw_dir = "./data/building/raw/non_filtered_simulated_question_raw.csv"
    two_or_more_answers_questions_raw_dir = "./data/building/raw/two_or_more_answers_simulated_questions_raw.csv"

    write = True
    
    savefile_path_list = ["./data/building/raw/" + f for f in ["raw1836.v3", "raw1839.v3","raw1849.v3"]]
    # savefile_path_list = ["./data/building/raw/" + f for f in ["raw1836.v3"]]

    # sql or cql 
    extraction_mode = ["sql", "cql"]

    # country list
    country_code_list = ["NGF", "USA", "AUS", "GBR", "FRA", "PRU", "RUS", "CHI", "JAP",  "KOR"]
    # country_code_list = ["NGF", "KOR"]
    BUILDING_INCR = 5

    questions = []
    non_filtered_questions = []
    two_or_more_answers_question=[]

    for savefile_path in savefile_path_list:
        
        year = savefile_path[-7:-3]

        print("extracting on {}".format(savefile_path))

        for country_code in country_code_list:

            (_, goods_list, building_dict) = initialize(country_code, file_path=savefile_path)
            
            if building_dict == None:
                continue

            base_goods_list, base_building_dict=simulate(goods_list, building_dict)
            
            # base query
            if write and ("cql" in extraction_mode):
                cql = extract_cql(base_goods_list, base_building_dict)
                query_path = cql_dir + f"{country_code}{year}.cql"
                with open(query_path,"w") as file:
                    file.write(cql)
                file.close()

            if write and ("sql" in extraction_mode):
                sql = extract_sql(base_goods_list, base_building_dict)
                query_path = sql_dir + f"{country_code}{year}.sql"
                with open(query_path,"w") as file:
                    file.write(sql)
                file.close()
                
            for goods_id in tqdm(range(len(goods_list))):
                
                assert(goods_id != -1)

                max_result = None
                min_result = None

                max_building_id = -1
                min_building_id = -1

                answers_bids=[]

                max_val = base_goods_list[goods_id].current_price
                min_val = base_goods_list[goods_id].current_price
                for b in base_building_dict.values():
                    goods_list = copy.deepcopy(base_goods_list)
                    building_dict = copy.deepcopy(base_building_dict)
                    building_dict = modification(building_dict, b.id, BUILDING_INCR)
                    
                    goods_list, building_dict = simulate(goods_list, building_dict)
                    
                    # if goods_list[goods_id].current_price > max_val:
                    #     # max_result = copy.deepcopy(goods_list[goods_id])
                    #     answers_bids=[]
                    #     max_val = goods_list[goods_id].current_price
                    #     max_building_id = b.id
                    # el
                    if goods_list[goods_id].current_price < min_val:
                        min_result = copy.deepcopy(goods_list[goods_id])
                        answers_bids = []
                        min_building_id = b.id
                        min_val = goods_list[goods_id].current_price
                    elif goods_list[goods_id].current_price == min_val:
                        answers_bids.append(b.id)

                if (min_building_id != -1) and (goods_id in building_dict[min_building_id].max_supply.keys()):
                    questions.append([country_code+year] + [goods_list[goods_id].name] + [min_building_id])
                    if len(answers_bids) >1:
                        two_or_more_answers_question.append([country_code+year] + [goods_list[goods_id].name] + ["{}".format(answers_bids)])

                elif (min_building_id != -1):
                    non_filtered_questions.append([country_code+year] + [goods_list[goods_id].name] + [min_building_id])


    df = pd.DataFrame(data=questions, index=range(len(questions)), columns = ["Country", "Goods_to_Minimize", "Answer_id"])
    df.to_csv(raw_dir)

    df = pd.DataFrame(data=non_filtered_questions, index=range(len(non_filtered_questions)), columns = ["Country", "Goods_to_Minimize", "Answer_id"])
    df.to_csv(non_filtered_questions_raw_dir)

    df = pd.DataFrame(data=two_or_more_answers_question, index=range(len(two_or_more_answers_question)), columns = ["Country", "Goods_to_Minimize", "Answer_id"])
    df.to_csv(two_or_more_answers_questions_raw_dir)

    print("questions",len(questions))
    print("nonfiltered",len(non_filtered_questions))
    print("two answers",len(two_or_more_answers_question))
    
            