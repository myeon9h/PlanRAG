from src.data_parsers.locating.queries_gen.anonymize import *

from src.data_parsers.locating.example_gen.parser import *

import random
import pandas as pd
import numpy as np
import copy

import LPGgen as lpg

CARAVAN_EFFECT = True
CARAVAN_MAX = 50

HOP_MUL = 1.05
RANDOM_SEED = 1

MAX_QUESTION_NUM=200

find_flow_cache = dict()

def construct(file=None):
    wrapper = lpg.LPGwrapper()
    if file:
        wrapper.generate(game_savefile=file)
    else:
        wrapper.generate()
    return wrapper

def simulation(wrapper):
    simulated_nodes_name = set()

    def find_flow(flow_list, up, down):
        global find_flow_cache
        if down in find_flow_cache[up].keys():
            return find_flow_cache[up][down]


        downlist = []
        for flow in flow_list:
            if (flow["source"] == up and flow["dest"] == down):
                find_flow_cache[up][down] = down
                return down
            elif (flow["source"] == up):
                downlist.append(flow["dest"])
        
        for u in downlist:
            flow = find_flow(flow_list, u, down)
            if flow is not None:
                find_flow_cache[up][down] = u
                return u
        
        return None

    def find_top_node(wrapper, simulated_nodes_name):

        all_nodes_name = set(wrapper.trade_nodes_dict.keys())

        trade_nodes_flow = wrapper.trade_node_flow
        available_nodes = all_nodes_name-simulated_nodes_name
        available_flow = list()
        
        for flow in trade_nodes_flow:
            if flow["source"] not in simulated_nodes_name and flow["dest"] not in simulated_nodes_name:
                available_flow.append(flow)

        for flow in available_flow:
            d_node = flow["dest"]

            if d_node in available_nodes:
                available_nodes.remove(d_node)
            else:
                continue
        
        if available_nodes != set():
            return available_nodes.pop()
        else:
            return None

    def trading_power_estimation(wrapper):

        for idx in range(len(wrapper.node_country)):
            if wrapper.node_country[idx]["has_merchant"]:
                if CARAVAN_EFFECT and wrapper.trade_nodes_dict[wrapper.node_country[idx]["trade_node"]]["is_inland"]:
                    wrapper.node_country[idx]["calculated_trading_power"] = 1.05*(wrapper.node_country[idx]["base_trading_power"] +2 + max(CARAVAN_MAX, wrapper.countries_dict[wrapper.node_country[idx]["country_name"]]["development"]))

                else:
                    wrapper.node_country[idx]["calculated_trading_power"] = 1.05*(wrapper.node_country[idx]["base_trading_power"] +2)
            else:
                wrapper.node_country[idx]["calculated_trading_power"] = wrapper.node_country[idx]["base_trading_power"]
            
            wrapper.trade_nodes_dict[wrapper.node_country[idx]["trade_node"]]["total_power"] = wrapper.trade_nodes_dict[wrapper.node_country[idx]["trade_node"]]["total_power"] + wrapper.node_country[idx]["calculated_trading_power"]

        return wrapper


    def flow_estimation(wrapper, source_trade_node):
        
        flow_list = []
        outgoing_trade_pow = dict()
        
        outgoing_overall_pow = 0
        for idx in range(len(wrapper.trade_node_flow)):
            flow = wrapper.trade_node_flow[idx]
            if flow["source"] == source_trade_node:
                flow_list.append((idx, flow["dest"]))
                outgoing_trade_pow[flow["dest"]]=0

        for record in wrapper.node_country:
            if record["trade_node"] == source_trade_node and not record["is_home"]:
                outgoing_overall_pow += record["calculated_trading_power"]
                if record["has_merchant"] == True:
                    country_name = record["country_name"]
                    home = wrapper.countries_dict[country_name]["home_node"]
                    if home in outgoing_trade_pow.keys():
                        outgoing_trade_pow[home] = outgoing_trade_pow[home]+ record["calculated_trading_power"]
                    else:
                        flow = find_flow(wrapper.trade_node_flow, source_trade_node, home)

                        if flow is not None:
                            outgoing_trade_pow[flow] = outgoing_trade_pow[flow]+ record["calculated_trading_power"]
                else:
                    continue
                


        
        outgoing_overall_merchant_pow = sum(outgoing_trade_pow.values())
         
        if wrapper.trade_nodes_dict[source_trade_node]["total_power"] != 0:
            wrapper.trade_nodes_dict[source_trade_node]["outgoing"] = (wrapper.trade_nodes_dict[source_trade_node]["local_value"]+wrapper.trade_nodes_dict[source_trade_node]["ingoing"])*(outgoing_overall_pow/wrapper.trade_nodes_dict[source_trade_node]["total_power"])

        for flow in flow_list:
            flow_idx = flow[0]
            flow_dest = flow[1]

            if outgoing_overall_merchant_pow != 0:
                flow_value = wrapper.trade_nodes_dict[source_trade_node]["outgoing"]*(outgoing_trade_pow[flow_dest]/outgoing_overall_merchant_pow)
            else:
                flow_value = wrapper.trade_nodes_dict[source_trade_node]["outgoing"]/len(outgoing_trade_pow)

            wrapper.trade_node_flow[flow_idx]["flow"] = flow_value
            
            wrapper.trade_nodes_dict[flow_dest]["ingoing"] = wrapper.trade_nodes_dict[flow_dest]["ingoing"] + HOP_MUL*flow_value
        

    wrapper = trading_power_estimation(wrapper)
    object_node = find_top_node(wrapper, simulated_nodes_name)
    while (object_node) != None:
        flow_estimation(wrapper, object_node)
        simulated_nodes_name.add(object_node)
        object_node = find_top_node(wrapper, simulated_nodes_name)

    return wrapper

def modification(wrapper,mode, input):

    if mode == "country del":
        for idx in range(len(wrapper.node_country)):
            record = wrapper.node_country[idx]
            if record["country_name"] == input:
                wrapper.node_country[idx]["has_merchant"] = False


    elif mode == "merchant allocate":
        country = input[0]
        node = input[1]

        for idx in range(len(wrapper.node_country)):
            record = wrapper.node_country[idx]
            if record["country_name"] == country and record["trade_node"] == node:
                wrapper.node_country[idx]["has_merchant"] = True

    return wrapper


# mode 는 cql 과 sql 가 있다.
def extraction_cql(wrapper):
    query = ""

    for trade_node in wrapper.trade_nodes_dict.keys():
        node_val = wrapper.trade_nodes_dict[trade_node]
        query = query + "CREATE ({0}:Trade_node {{name:\"{0}\", local_value:{1}, is_inland:{2}, total_power:{3}, outgoing:{4}, ingoing:{5}}});\n".format(trade_node, node_val["local_value"], ("true" if node_val["is_inland"] else "false"), node_val["total_power"], node_val["outgoing"], node_val["ingoing"])

    for con in wrapper.countries_dict.keys():
        con_val = wrapper.countries_dict[con]
        query = query + "CREATE ({0}:Country {{name:\"{0}\", home_node:\"{1}\", development:{2}}});\n".format(con, con_val["home_node"], con_val["development"])


    for flow in wrapper.trade_node_flow:
        up = flow["source"]
        down = flow["dest"]
        val = flow["flow"]
        query = query + "MATCH ({0}:Trade_node {{name:\"{0}\"}}), ({1}:Trade_node {{name:\"{1}\"}}) CREATE ({0})-[r:source{{flow:{2}}}]->({1});\n".format(up, down,val)

    for tc in wrapper.node_country:
        node = tc["trade_node"]
        con = tc["country_name"]
        query = query + "MATCH ({0}:Trade_node {{name:\"{0}\"}}), ({1}:Country {{name:\"{1}\"}}) CREATE ({1})-[r:NodeCountry{{is_home: {2}, has_merchant: \"{3}\",base_trading_power: {4},calculated_trading_power: {5}}}]->({0});\n".format(node, con, ("true" if tc["is_home"] else "false"), tc["has_merchant"], tc["base_trading_power"], tc["calculated_trading_power"])
    return query

def extraction_sql(wrapper):
    query = ""

    # table init
    query = query +"""

CREATE TABLE country( country_name  VARCHAR(30), home_node    VARCHAR(30), development FLOAT, PRIMARY KEY (country_name));

CREATE TABLE trade_node(    trade_node    VARCHAR(30), local_value FLOAT,    is_inland BOOLEAN,    total_power FLOAT,    outgoing FLOAT,    ingoing FLOAT,   PRIMARY KEY (trade_node));

CREATE TABLE flow(    source    VARCHAR(30),    dest VARCHAR(30),    flow FLOAT,   PRIMARY KEY (source, dest));

CREATE TABLE node_country(    trade_node     VARCHAR(30), country_name    VARCHAR(30),    is_home BOOLEAN, has_merchant BOOLEAN,    base_trading_power FLOAT,    calculated_trading_power FLOAT,   PRIMARY KEY (trade_node, country_name));
    
"""


    # country table
    for con in wrapper.countries_dict.keys():
        con_val = wrapper.countries_dict[con]
        query = query + "INSERT INTO country(country_name,home_node,development) VALUES (\"{0}\", \"{1}\", {2});\n".format(con, con_val["home_node"],con_val["development"])

    # trade_node table
    for trade_node in wrapper.trade_nodes_dict.keys():
        node_val = wrapper.trade_nodes_dict[trade_node]
        query = query + "INSERT INTO trade_node(trade_node, local_value, is_inland, total_power, outgoing, ingoing) VALUES (\"{0}\", {1}, {2}, {3}, {4}, {5});\n".format(trade_node, node_val["local_value"], ("TRUE" if node_val["is_inland"] else "FALSE"), node_val["total_power"], node_val["outgoing"], node_val["ingoing"])

    
    # flow table
    for flow in wrapper.trade_node_flow:
        up = flow["source"]
        down = flow["dest"]
        val = flow["flow"]
        query = query + "INSERT INTO flow(source, dest, flow) VALUES (\"{0}\", \"{1}\", {2});\n".format(up, down,val)

    # node_country table
    for tc in wrapper.node_country:
        node = tc["trade_node"]
        con = tc["country_name"]
        query = query + "INSERT INTO node_country(trade_node,country_name, is_home, has_merchant, base_trading_power, calculated_trading_power) VALUES (\"{0}\", \"{1}\", {2}, {3}, {4}, {5});\n".format(node, con, ("TRUE" if tc["is_home"] else "FALSE"), ("TRUE" if tc["has_merchant"] else "FALSE"), tc["base_trading_power"], tc["calculated_trading_power"])

    return query


def estimation(wrapper, country):
    home = wrapper.countries_dict[country]["home_node"]
    for tc in wrapper.node_country:
        if tc["country_name"] == country and tc["trade_node"] == home:
            break
    
    home_node = wrapper.trade_nodes_dict[home]
    home_node_overall_profit = home_node["local_value"]-home_node["outgoing"]+home_node["ingoing"]

    return home_node_overall_profit*(tc["calculated_trading_power"]/home_node["total_power"])

def option_gen(wrapper, con):
    random.seed(RANDOM_SEED)
    home = wrapper.countries_dict[con]["home_node"]

    options = []
    for rec in wrapper.trade_node_flow:
        if rec["dest"] == home:
            options.append(rec["source"])
    
    nodes = list(wrapper.trade_nodes_dict.keys())

    if len(options) > 4:
        return options[:4]
    else:
        while len(options) < 4:
            node = random.choice(nodes)
            if node not in options and node != home:
                options.append(node)
        return options 

def problem_gen(file=None, write = True, verbose = True, extraction_modes = ["cql"]):
    global question_number

    original_wrapper = construct(file)

    

    for k in original_wrapper.trade_nodes_dict.keys():
        find_flow_cache[k] = dict()

    cql_dir = "./data/locating/db_query(parsed)/LPG_format/"
    sql_dir = "./data/locating/db_query(parsed)/SQL_format/"

    raw_dir = "./data/locating/raw/simulated_question_raw{}.csv".format(file[-8:-4])
    countries = []
    for con in original_wrapper.countries_dict.keys():
        if original_wrapper.countries_dict[con]["development"]>50:
            countries.append(con)

    print(f"target_countries : {countries}")

    questions = []
    for con in countries:

        # if question_number >= MAX_QUESTION_NUM:
        #     break

        copied_original_wrapper = copy.deepcopy(original_wrapper)
        question_number = question_number+1

        country_wrapper = modification(copied_original_wrapper, "country del", con)

        country_wrapper = simulation(country_wrapper)

        if write and ("cql" in extraction_modes):
            cql = extraction_cql(country_wrapper)
            query_path = cql_dir+f"q{question_number}.cql"
            with open(query_path, "w") as file:
                file.write(cql)
            file.close()

        if write and ("sql" in extraction_modes):
            sql = extraction_sql(country_wrapper)
            query_path = sql_dir+f"q{question_number}.sql"
            with open(query_path, "w") as file:
                file.write(sql)
            file.close()

        options = list(country_wrapper.trade_nodes_dict.keys())
        options.remove(country_wrapper.countries_dict[con]["home_node"])
        

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

        questions.append([con]+ [ans])

    df = pd.DataFrame(data=questions, index= range(len(questions)), columns = ["Country","Answer"])

    if write:
        df.to_csv(raw_dir)




if __name__ == "__main__":

    individual = False
    files = ["./data/locating/raw/raw1445.eu4", "./data/locating/raw/raw1618.eu4", "./data/locating/raw/raw1701.eu4"]
    extraction_modes = ["sql", "cql"]
    
    question_number = 0


    if individual:
        original_wrapper = construct(file=None)
        
        for k in original_wrapper.trade_nodes_dict.keys():
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
        for file in files:
            problem_gen(file=file,write=True, verbose=False, extraction_modes=extraction_modes)