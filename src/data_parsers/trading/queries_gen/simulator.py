from src.data_parsers.trading.queries_gen.tradenode import Node
from src.data_parsers.trading.queries_gen.node_parser_graph import node_parser
from src.data_parsers.trading.queries_gen.node_parser_rdb import node_value_injector
from src.data_parsers.trading.queries_gen.node_visualizer import node_visualizer
from src.data_parsers.trading.queries_gen.query_generator import cql_gen, sql_gen
from src.data_parsers.trading.queries_gen.anonymize import *

from src.data_parsers.trading.example_gen.parser import *
import networkx as nx

import json, os
import random
import pandas as pd
import numpy as np
import copy

import LPGgen as lpg

CARAVAN_EFFECT = True
CARAVAN_MAX = 50

# 1-hop 당 1.05배
HOP_MUL = 1.05
RANDOM_SEED = 1

find_flow_cache = dict()

# LPG gen 으로 대체
def construct(file=None):
    wrapper = lpg.LPGwrapper()
    if file:
        wrapper.generate(file)
    else:
        wrapper.generate()
    return wrapper

# simulation 이란 주어진 wrapper 에서 다음 값들을 그 이외의 값들로 계산하는 작업을 의미함.
# trading_node 의 total_power (merchant 효과가 더해진 것)
# T-T table 의 flow value (flow value 는 5% 룰이 적용되지 않은 상태를 의미)
# T-C table 의 calculated_trading_power (merchant 효과가 더해진 것)
def simulation(wrapper):
    # 이미 시뮬레이션 된 노드의 이름을 저장하는 세트
    simulated_nodes_name = set()

    # 나가는 flow 를 찾는 코드
    def find_flow(flow_list, up, down):
        global find_flow_cache
        if down in find_flow_cache[up].keys():
            return find_flow_cache[up][down]


        downlist = []
        for flow in flow_list:
            if (flow["upstream"] == up and flow["downstream"] == down):
                find_flow_cache[up][down] = down
                return down
            elif (flow["upstream"] == up):
                downlist.append(flow["downstream"])
        
        for u in downlist:
            flow = find_flow(flow_list, u, down)
            if flow is not None:
                find_flow_cache[up][down] = u
                return u
        
        return None

    # 자신의 상류 노드가 없는 노드를 찾아 반환. 여러 개 있다면 하나만 반환.
    def find_top_node(wrapper, simulated_nodes_name):

        all_nodes_name = set(wrapper.trading_nodes_dict.keys())

        trading_nodes_flow = wrapper.trading_node_flow
        available_nodes = all_nodes_name-simulated_nodes_name
        available_flow = list()
        
        for flow in trading_nodes_flow:
            if flow["upstream"] not in simulated_nodes_name and flow["downstream"] not in simulated_nodes_name:
                available_flow.append(flow)

        for flow in available_flow:
            d_node = flow["downstream"]

            if d_node in available_nodes:
                available_nodes.remove(d_node)
            else:
                continue
        
        if available_nodes != set():
            return available_nodes.pop()
        else:
            return None

    # total power 와 calculated_trading_power 계산후 반영
    def trading_power_estimation(wrapper):

        for idx in range(len(wrapper.node_country)):
            if wrapper.node_country[idx]["merchant"]:
                if CARAVAN_EFFECT and wrapper.trading_nodes_dict[wrapper.node_country[idx]["node_name"]]["node_inland"]:
                    wrapper.node_country[idx]["calculated_trading_power"] = 1.05*(wrapper.node_country[idx]["base_trading_power"] +2 + max(CARAVAN_MAX, wrapper.countries_dict[wrapper.node_country[idx]["country_name"]]["development"]))

                else:
                    wrapper.node_country[idx]["calculated_trading_power"] = 1.05*(wrapper.node_country[idx]["base_trading_power"] +2)
            else:
                wrapper.node_country[idx]["calculated_trading_power"] = wrapper.node_country[idx]["base_trading_power"]
            
            wrapper.trading_nodes_dict[wrapper.node_country[idx]["node_name"]]["total_power"] = wrapper.trading_nodes_dict[wrapper.node_country[idx]["node_name"]]["total_power"] + wrapper.node_country[idx]["calculated_trading_power"]

        return wrapper


    # 빠져나가는게 얼마일지 예측하고, flow value 에 반영.
    # flow 한 것을 다음 노드에 ingoing 으로도 반영
    def flow_estimation(wrapper, upstream_node_name):
        
        # flow finding (index)
        flow_list = []
        # downstream 노드에 따라 얼마나 분배되는지를 dict 형태로 표현. 여기에는 merchant 만 나누어 넣음.
        outgoing_trade_pow = dict()
        
        # 그냥 외부 노드를 의미.
        outgoing_overall_pow = 0
        for idx in range(len(wrapper.trading_node_flow)):
            flow = wrapper.trading_node_flow[idx]
            if flow["upstream"] == upstream_node_name:
                flow_list.append((idx, flow["downstream"]))
                outgoing_trade_pow[flow["downstream"]]=0
        # print(upstream_node_name, flow_list)

        for record in wrapper.node_country:
            if record["node_name"] == upstream_node_name and not record["is_home"]:
                outgoing_overall_pow += record["calculated_trading_power"]
                if record["merchant"] == True:
                    country_name = record["country_name"]
                    home = wrapper.countries_dict[country_name]["trade_port"]
                    if home in outgoing_trade_pow.keys():
                        outgoing_trade_pow[home] = outgoing_trade_pow[home]+ record["calculated_trading_power"]
                    else:
                        # print(country_name, home)
                        flow = find_flow(wrapper.trading_node_flow, upstream_node_name, home)

                        if flow is not None:
                            outgoing_trade_pow[flow] = outgoing_trade_pow[flow]+ record["calculated_trading_power"]
                else:
                    continue
                


        
        outgoing_overall_merchant_pow = sum(outgoing_trade_pow.values())
         
        if wrapper.trading_nodes_dict[upstream_node_name]["total_power"] != 0:
            wrapper.trading_nodes_dict[upstream_node_name]["outgoing"] = (wrapper.trading_nodes_dict[upstream_node_name]["local_value"]+wrapper.trading_nodes_dict[upstream_node_name]["ingoing"])*(outgoing_overall_pow/wrapper.trading_nodes_dict[upstream_node_name]["total_power"])

        for flow in flow_list:
            flow_idx = flow[0]
            flow_downstream = flow[1]
            # flow_upstream = upstream_node_name

            if outgoing_overall_merchant_pow != 0:
                flow_value = wrapper.trading_nodes_dict[upstream_node_name]["outgoing"]*(outgoing_trade_pow[flow_downstream]/outgoing_overall_merchant_pow)
            else:
                flow_value = wrapper.trading_nodes_dict[upstream_node_name]["outgoing"]/len(outgoing_trade_pow)

            wrapper.trading_node_flow[flow_idx]["flow"] = flow_value
            
            wrapper.trading_nodes_dict[flow_downstream]["ingoing"] = wrapper.trading_nodes_dict[flow_downstream]["ingoing"] + HOP_MUL*flow_value
        

    wrapper = trading_power_estimation(wrapper)
    object_node = find_top_node(wrapper, simulated_nodes_name)
    while (object_node) != None:
        flow_estimation(wrapper, object_node)
        object_node = find_top_node(wrapper, simulated_nodes_name)
        simulated_nodes_name.add(object_node)

    return wrapper

# modification 이란 특정 패턴을 wrapper 에서 삭제하는 함수를 의미함.
def modification(wrapper,mode, input):

    # country delete 의 경우에는 country 와 관련된 merchant 들을 전부 삭제하는 함수이다.
    # 이때 input 은 country name (country code) 이다.
    if mode == "country del":
        for idx in range(len(wrapper.node_country)):
            record = wrapper.node_country[idx]
            if record["country_name"] == input:
                wrapper.node_country[idx]["merchant"] = False


    # merchant allocate 는 country 에 특정 merchant 를 allocate 하는 함수이다.
    # input 은 (country code, node name) 이다.
    elif mode == "merchant allocate":
        country = input[0]
        node = input[1]

        for idx in range(len(wrapper.node_country)):
            record = wrapper.node_country[idx]
            if record["country_name"] == country and record["node_name"] == node:
                wrapper.node_country[idx]["merchant"] = True

    return wrapper


# wrapper 를 사이퍼 쿼리로 extract 하는 코드
def extraction(wrapper):
    query = ""

    # nodes 저장
    for node_name in wrapper.trading_nodes_dict.keys():
        node_val = wrapper.trading_nodes_dict[node_name]
        query = query + "CREATE ({0}:Trade_node {{name:\"{0}\", local_value:{1}, node_inland:{2}, total_power:{3}, outgoing:{4}, ingoing:{5}}});\n".format(node_name, node_val["local_value"], ("true" if node_val["node_inland"] else "false"), node_val["total_power"], node_val["outgoing"], node_val["ingoing"])

    # countries 저장
    for con in wrapper.countries_dict.keys():
        con_val = wrapper.countries_dict[con]
        query = query + "CREATE ({0}:Country {{name:\"{0}\", trade_port:\"{1}\", development:{2}}});\n".format(con, con_val["trade_port"], con_val["development"])


    # T-T 연결
    for flow in wrapper.trading_node_flow:
        up = flow["upstream"]
        down = flow["downstream"]
        val = flow["flow"]
        query = query + "MATCH ({0}:Trade_node {{name:\"{0}\"}}), ({1}:Trade_node {{name:\"{1}\"}}) CREATE ({0})-[r:UPSTREAM{{flow:{2}}}]->({1});\n".format(up, down,val)

    # T-C 연결
    for tc in wrapper.node_country:
        node = tc["node_name"]
        con = tc["country_name"]
        query = query + "MATCH ({0}:Trade_node {{name:\"{0}\"}}), ({1}:Country {{name:\"{1}\"}}) CREATE ({1})-[r:NodeCountry{{is_home: {2}, merchant: \"{3}\",base_trading_power: {4},calculated_trading_power: {5}}}]->({0});\n".format(node, con, ("true" if tc["is_home"] else "false"), tc["merchant"], tc["base_trading_power"], tc["calculated_trading_power"])




    return query

# estimation 이란 어떤 국가가 자신의 home node 에서 벌어들이는 총 수익을 계산하는 함수임.
def estimation(wrapper, country):
    home = wrapper.countries_dict[country]["trade_port"]
    for tc in wrapper.node_country:
        if tc["country_name"] == country and tc["node_name"] == home:
            break
    
    home_node = wrapper.trading_nodes_dict[home]
    home_node_overall_profit = home_node["local_value"]-home_node["outgoing"]+home_node["ingoing"]

    return home_node_overall_profit*(tc["calculated_trading_power"]/home_node["total_power"])

def option_gen(wrapper, con):
    random.seed(RANDOM_SEED)
    home = wrapper.countries_dict[con]["trade_port"]

    options = []
    # hard negative
    for rec in wrapper.trading_node_flow:
        if rec["downstream"] == home:
            options.append(rec["upstream"])
    
    nodes = list(wrapper.trading_nodes_dict.keys())

    if len(options) > 4:
        return options[:4]
    else:
        while len(options) < 4:
            node = random.choice(nodes)
            if node not in options and node != home:
                options.append(node)
        return options 

def problem_gen(file=None, write = True, verbose = True, subjective=False):
    

    original_wrapper = construct(file)

    

    for k in original_wrapper.trading_nodes_dict.keys():
        find_flow_cache[k] = dict()

    query_dir = "./data/trading/db_query(parsed)/LPG_format/"

    raw_dir = "./data/trading/raw/simulated_question_raw.csv"
    # f = open(raw_dir, "w")
    countries = []
    for con in original_wrapper.countries_dict.keys():
        if original_wrapper.countries_dict[con]["development"]>50:
            countries.append(con)

    print(f"target_countries : {countries}")

    questions = []
    question_number = 0
    for con in countries:

        
        copied_original_wrapper = copy.deepcopy(original_wrapper)
        question_number = question_number+1

        # 평가할 국가의 merchant 를 모두 삭제 
        country_wrapper = modification(copied_original_wrapper, "country del", con)

        country_wrapper = simulation(country_wrapper)

        # 해당 국가의 상황에서 사이퍼쿼리 생성하고, 저장하기
        cql = extraction(country_wrapper)
        if write:
            query_path = query_dir+f"q{question_number}.cql"
            with open(query_path, "w") as file:
                file.write(cql)
            
            file.close()



        # options 생성. hard negative 로 최대한 채움.
        if subjective:
            # 자기 자신 제외
            options = list(country_wrapper.trading_nodes_dict.keys())
            options.remove(country_wrapper.countries_dict[con]["trade_port"])
        else:
            options = option_gen(country_wrapper, con)
            assert(len(options) == 4)

        # options 들을 검증
        profit_prev = 0
        ans = None

        for o in options:
            copied_country_wrapper = copy.deepcopy(country_wrapper)
            option_wrapper = modification(copied_country_wrapper, "merchant allocate", (con, o))
            option_wrapper = simulation(option_wrapper)
            profit = estimation(option_wrapper, con)
            
            if verbose:
                print(f"option: {o} profit: {profit}")

            if profit > profit_prev:
                profit_prev = profit
                ans = o

        if verbose:
            print(f"country: {con}, options: {options} ans: {ans}")
        else:
            print(f"q{question_number} country: {con}, ans: {ans}")
        options.remove(ans)
        questions.append([con]+ [ans]+options)

    if (not subjective):
        df = pd.DataFrame(data=questions, index= range(len(questions)), columns = ["Country","Answer", "Example 1", "Example 2", "Example 3"])
        print(df)
    if (not subjective and write):
        df.to_csv(raw_dir)



    
    # wrapper = simulation(wrapper)
    # print(estimation(wrapper, "POL"))


if __name__ == "__main__":

    individual = False
    file=None
    # file = "./data/trading/raw/(1533case)Portugal_research_1533_03.txt"
    
    if individual:
        original_wrapper = construct(file)
        
        for k in original_wrapper.trading_nodes_dict.keys():
            find_flow_cache[k] = dict()
        con = "NAP"
        options = ['champagne', 'alexandria', "ragusa", "tunis"]
        copied_original_wrapper = copy.deepcopy(original_wrapper)
        country_wrapper = modification(copied_original_wrapper, "country del", con)

        
        profit_prev = 0
        for o in options:
            copied_country_wrapper = copy.deepcopy(country_wrapper)
            option_wrapper = modification(copied_country_wrapper, "merchant allocate", (con, o))
            option_wrapper = simulation(option_wrapper)
            profit = estimation(option_wrapper, con)

            print(f"option: {o}, profit: {profit}")
            if profit > profit_prev:
                profit_prev = profit
                ans = o
            
        print(f"country: {con}, options: {options}, ans: {ans}")
    else:
        problem_gen(file=file,write=False, verbose=False, subjective=True)