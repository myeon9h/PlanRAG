
from enum import Enum
from tqdm import tqdm
import os



class State(Enum):
    LINE = 1
    PROVINCE_REGISTER = 2
    PROVINCE = 3
    # MEMBERS = 4

class CountryState(Enum):
    LINE=1
    COUNTRY_REGISTER=2
    TRADE = 3

class MerchantState(Enum):
    LINE = 1
    MERCHANT_REGISTER = 2


example_data = """
provinces={
-1={
		name="Stockholm"
		owner="SWE"
		controller="SWE"
		previous_controller="REB"
		institutions={
			100.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 
		}
		cores={
			SWE 
		}
		trade="baltic_sea"
		unit={
			id=13
			type=54
		}
        ...
        
"""


def province_parser(file_name="./data/trading/raw/(1445case)Castile_research_1445_02.eu4"):

    file = open(file_name, 'r')
    data_list = file.readlines()
    state = State.LINE
    
    province_dict = dict()

    province_index = 0


    for line in tqdm(data_list):


        line = line.replace("\n", "")

        if state == State.LINE:
            if (line == "provinces={"):
                state = State.PROVINCE_REGISTER
                continue
            else:
                continue
        
        elif state == State.PROVINCE_REGISTER:
            if line == "}":
                break
            
            if line == "":
                continue
            
            if line[0] != "-":
                continue
            line_list = line.replace("-", "").split("=")
            province_index = int(line_list[0])
            state = State.PROVINCE
            continue
        
        elif state == State.PROVINCE:
            if line == "\t}":
                state = State.PROVINCE_REGISTER


            line_list = line.split("=")
            if (line_list[0]=="\t\ttrade"):
                province_trade = line_list[1].replace("\"","")
                
                province_dict[province_index]=province_trade
                state = State.PROVINCE_REGISTER
            
            else:
                continue

        else:
            # assert(0)
            continue

    file.close()
    return province_dict

def country_parser(file_name="./data/trading/raw/(1445case)Castile_research_1445_02.eu4"):

    file = open(file_name, 'r')
    data_list = file.readlines()
    state = CountryState.LINE
    
    country_dict = dict()

    country_code = ""

    development = -1
    for line in tqdm(data_list):


        line = line.replace("\n", "")

        if state == CountryState.LINE:
            if (line == "countries={"):
                state = CountryState.COUNTRY_REGISTER
                continue
            else:
                continue
        
        elif state == CountryState.COUNTRY_REGISTER:
            if line == "}":
                break
            
            if line == "":
                continue
            
            if not (line[0] == "\t" and line[4:] == "={"):
                continue
            
            line_list = line.replace("\t", "").split("=")
            country_code = line_list[0]
            state = CountryState.TRADE
            continue
        
        elif state == CountryState.TRADE:
            line_list = line.split("=")
            if (line_list[0]=="\t\ttrade_port"):
                province_trade = line_list[1].replace("\"","")
                
                # country_dict[country_code]=int(province_trade)
                state = CountryState.TRADE
            elif (line_list[0]=="\t\tdevelopment"):
                development = line_list[1].replace("\"","")


            elif (line_list[0] == "\t}"):
                state = CountryState.COUNTRY_REGISTER
                country_dict[country_code]={"development": float(development),"trade_port": int(province_trade)}
                development = -1
                province_trade = -1
            else:
                continue

        else:
            # assert(0)
            continue

    file.close()
    return country_dict

def merchant_parser(file_name="./data/trading/raw/(1445case)Castile_research_1445_02.eu4"):
    merchant_path_list = []

    file = open(file_name, 'r')
    data_list = file.readlines()
    state = MerchantState.LINE

    for line in tqdm(data_list):
        line = line.replace("\n", "")

        if line == "\t\tmerchant_construction={" and state == MerchantState.LINE:
            state = MerchantState.MERCHANT_REGISTER
            path_dict = dict()
        
        elif state == MerchantState.MERCHANT_REGISTER:
            if line == "\t\t}":
                state = MerchantState.LINE
                merchant_path_list.append(path_dict)
            else:
                line_list = line.replace("\t", "").split("=")
                path_dict[line_list[0]]=line_list[1]
                
    return merchant_path_list



if __name__=="__main__":
    province_dict = province_parser()
    # country_dict = country_parser()

    # print(country_dict)
    # print(len(country_dict))
    print(province_dict)
    
