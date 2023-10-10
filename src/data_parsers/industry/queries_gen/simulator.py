import building
import country
import goods
from tqdm import tqdm 
import copy
import pandas as pd

def initialize(country_code, file_path = "./data/industry/raw/france_research_noncloud.v3", goods_file_path = "./data/industry/raw/goods/00_goods.txt"):

    cnt = country.country_extracting(file_path, country_code)
    goods_list = initialize_goods(cnt)
    building_dict = initialize_buildings(cnt)

    return (cnt, goods_list, building_dict)


# goods 와 그 demand, supply 등을 initialize.
# 여기서는 pop 에 의한 demand 만 고려함. buildings 에 의한 demand 는 나중에 고려됨
def initialize_goods(cnt: country.Country,goods_file = "./data/industry/raw/goods/00_goods.txt"):
    goods_list = goods.goods_finder(goods_file)
    for goods_code in range(len(goods_list)):
        # demand by pops
        goods_list[goods_code].pop_demand = (cnt.consume_by_pops[goods_code] if goods_code in cnt.consume_by_pops.keys()  else 0)
        # [goods_code] = 0


    return goods_list

def initialize_buildings(cnt:country.Country, file_path = "./data/industry/raw/france_research_noncloud.v3", goods_file_path = "./data/industry/raw/goods/00_goods.txt"):
    

    building_dict = building.extract_building()

    filtered_building_dict = dict()

    for bidx in building_dict.keys():
        if building_dict[bidx].state in cnt.states:
            filtered_building_dict[bidx] = building_dict[bidx]
    
    return filtered_building_dict


# building id 에 해당하는 building 의 level 에 mod_level 만큼을 더한다. 을 조정한다. 해당하는 building 은 max_demand 와 max_supply 도 조정된다.
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


# 내국 시장만 simulate 한다.
# modifications 에는 modification 의 id, level 이 Tuple 으로 주어진다.
def simulate(goods_list, building_dict, cycle = 10):

    # demand by bulidings
    # supply by buildings
    b_cnt = 0
    for b in building_dict.values():
        for goods_code in b.max_demand.keys():
            goods_list[goods_code].building_demand = goods_list[goods_code].building_demand + b.current_input[goods_code]
        for goods_code in b.max_supply.keys():
            goods_list[goods_code].supply = goods_list[goods_code].supply + b.max_supply[goods_code]
        b_cnt +=1



    # for key in range(len(goods_list)):
    #     print("{:10}|{:20}|{:15}|{:10}|{:10}".format(key,goods_list[key].name, goods_list[key].base_price, round(goods_list[key].supply, 2), round(goods_list[key].building_demand), 2))
    # print("------------------------------------------------")
    for i in range(cycle):

        # 실제 input 구하는 과정 (buliding 으로 얼마나 나누어지는가?: max demand 만큼 나눠진다.)
        for bidx in building_dict.keys():
            # print(bidx, building_dict[bidx])
            for goods_code in building_dict[bidx].max_demand.keys():

                building_dict[bidx].current_input[goods_code] = building_dict[bidx].max_demand[goods_code]*goods_list[goods_code].supply/(goods_list[goods_code].pop_demand + goods_list[goods_code].building_demand)


        for goods in goods_list:
            goods.supply = 0
            # goods.building_demand = 0

        # building 은 그것으로 얼마나 생산하는가?
        for b in building_dict.values():
            b.current_output_calculation()
            
            # buildings 들의 suppluy 로 goods 의 supply 는 어떻게 바뀌는가?
            for goods_code in b.current_output.keys():
                goods_list[goods_code].supply = goods_list[goods_code].supply + b.current_output[goods_code]
            
        # for key in range(len(goods_list)):
        #     print("{:10}|{:20}|{:15}|{:10}|{:10}".format(key,goods_list[key].name, goods_list[key].base_price, round(goods_list[key].supply, 2), round(goods_list[key].building_demand), 2))
        


    for g in goods_list:
        g.price_calculate()

    return goods_list, building_dict


if __name__ == "__main__":
    # goods_list = simulate("PRU")

    query_dir = "./data/industry/db_query(parsed)/LPG_format/"
    raw_dir = "./data/industry/raw/simulated_question_raw.csv"

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
            # goods_id 찾기
            
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

            # min_string = f"{building_dict[min_building_id]}" if min_building_id != -1 else None
            # print(f"for {goods_list[goods_id].name} in {country_code}, max_val = {round(max_val,3)} by {max_building_id}, min_val = {round(min_val, 3)} by {min_building_id} {min_string}")

            if min_building_id != -1:
                questions.append([country_code] + [goods_list[goods_id].name] + [min_building_id])
            
    df = pd.DataFrame(data=questions, index=range(len(questions)), columns = ["Country", "Goods_to_Minimize", "Answer_id"])
    df.to_csv(raw_dir)



            