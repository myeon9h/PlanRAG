import building
import country
import goods
from tqdm import tqdm 
import copy
import pandas as pd

def initialize(country_code, file_path = "./data/building/raw/test.v3", goods_file_path = "./data/building/raw/goods/00_goods.txt"):

    cnt = country.country_extracting(file_path, country_code)
    goods_list = initialize_goods(cnt)
    building_dict = initialize_buildings(cnt)

    return (cnt, goods_list, building_dict)


def initialize_goods(cnt: country.Country,goods_file = "./data/building/raw/goods/00_goods.txt"):
    goods_list = goods.goods_finder(goods_file)
    for goods_code in range(len(goods_list)):
        # demand by pops
        goods_list[goods_code].pop_demand = (cnt.consume_by_pops[goods_code] if goods_code in cnt.consume_by_pops.keys()  else 0)
        # [goods_code] = 0


    return goods_list

def initialize_buildings(cnt:country.Country, file_path = "./data/building/raw/test.v3", goods_file_path = "./data/building/raw/goods/00_goods.txt"):
    

    building_dict = building.extract_building()

    filtered_building_dict = dict()

    for bidx in building_dict.keys():
        if building_dict[bidx].state in cnt.states:
            filtered_building_dict[bidx] = building_dict[bidx]
    
    return filtered_building_dict

def modification(building_dict, id, mod_level):
    building_dict[id].level_change(building_dict[id].level+mod_level)
    return building_dict

def extract(goods_list, building_dict):
    query = ""

    for g in goods_list:
        query = query + g.lpg_format()

    for b in building_dict.values():
        query = query + b.lpg_format()

    return query


def simulate(goods_list, building_dict, cycle = 10):

    b_cnt = 0
    for b in building_dict.values():
        for goods_code in b.max_demand.keys():
            goods_list[goods_code].building_demand = goods_list[goods_code].building_demand + b.current_input[goods_code]
        for goods_code in b.max_supply.keys():
            goods_list[goods_code].supply = goods_list[goods_code].supply + b.max_supply[goods_code]
        b_cnt +=1



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

    query_dir = "./data/building/db_query(parsed)/LPG_format/"
    raw_dir = "./data/building/raw/simulated_question_raw.csv"

    write = True

    # country list
    country_code_list = ["USA", "AUS", "GBR", "FRA", "PRU", "RUS", "CHI", "JAP"]
    BUILDING_INCR = 5

    questions = []

    for country_code in country_code_list:

        (_, goods_list, building_dict) = initialize(country_code)
        base_goods_list, base_building_dict=simulate(goods_list, building_dict, cycle = 100)
        
        # base query
        cql = extract(base_goods_list, base_building_dict)
        if write:
            query_path = query_dir + f"{country_code}.cql"
            with open(query_path,"w") as file:
                file.write(cql)
            
            file.close()


        for goods_id in tqdm(range(len(goods_list))):
            
            assert(goods_id != -1)

            max_result = None
            min_result = None

            max_building_id = -1
            min_building_id = -1

            max_val = base_goods_list[goods_id].current_price
            min_val = base_goods_list[goods_id].current_price
            for b in base_building_dict.values():
                goods_list = copy.deepcopy(base_goods_list)
                building_dict = copy.deepcopy(base_building_dict)
                building_dict = modification(building_dict, b.id, BUILDING_INCR)
                
                goods_list, building_dict = simulate(goods_list, building_dict)
                
                if goods_list[goods_id].current_price > max_val:
                    # max_result = copy.deepcopy(goods_list[goods_id])
                    max_val = goods_list[goods_id].current_price
                    max_building_id = b.id
                elif goods_list[goods_id].current_price < min_val:
                    # min_result = copy.deepcopy(goods_list[goods_id])
                    min_building_id = b.id
                    min_val = goods_list[goods_id].current_price

            if (min_building_id != -1) and ( goods_id in building_dict[min_building_id].max_supply.keys()):
                questions.append([country_code] + [goods_list[goods_id].name] + [min_building_id])
            
    df = pd.DataFrame(data=questions, index=range(len(questions)), columns = ["Country", "Goods_to_Minimize", "Answer_id"])
    df.to_csv(raw_dir)

    print(len(questions))
            