from tradenode import Node
from node_parser_graph import node_parser
from node_parser_rdb import node_value_injector
from node_visualizer import node_visualizer
from query_generator import cql_gen, sql_gen

from src.data_parsers.trading.example_gen.parser import *
from anonymize import *
import networkx as nx

import json, os


class LPGwrapper:
    def __init__(self):
        self.trading_nodes_dict = dict()
        self.countries_dict = dict()
        self.trading_node_flow = []
        self.node_country = []


    def generate(self, game_savefile = "./data/trading/raw/(1445case)Castile_research_1445_02.eu4"):

        structure_file_name = "./data/trading/raw/tradenodes.txt"
        
        
        nodes_dict = node_parser(structure_file_name)
        nodes_dict = node_value_injector(nodes_dict, game_savefile)

        merchant_list = merchant_parser()
        province_dict = province_parser()
        country_dict = country_parser() #country_dict 는 country 와 그 trade_port 를 가지고 있음.


        # trading nodes 에 넣는 코드
        for node in nodes_dict.values():
            try:
                node_localvalue = node.node_values["local_value"]
            except:
                node_localvalue = 0

            try:
                node_total_power = node.node_values["total"]
            except:
                node_total_power = 0

            node_name = node.name
            node_inland = node.inland

            self.trading_nodes_dict[node_name] = {"local_value": float(node_localvalue), "node_inland": node_inland, "total_power": float(node_total_power), "outgoing": 0, "ingoing": 0}
        
        # countries 에 넣는 코드
        for country in country_dict.keys():
            country_val = country_dict[country]
            if country_val["development"] > 0:    
                self.countries_dict[country] =  {"trade_port": province_dict[country_val["trade_port"]], "development": float(country_val["development"])}
            pass


        #trading_nodes 사이 관계
        for node in nodes_dict.values():
            for downstream in node.out_going:
                self.trading_node_flow.append({"upstream": node.name, "flow": 0, "downstream": downstream})
        
        # merchant_dict 에는 노드별로 어떤 국가가 merchant를 allocate 했는지 상태가 들어있음
        merchant_dict = dict()
        for m in merchant_list:
            province_idx = int(m["node"])
            if (province_dict[province_idx] not in merchant_dict.keys()) and (m["type"] == '1'):
                merchant_dict[province_dict[province_idx]] = [m["country"]]
            elif ((province_dict[province_idx] not in merchant_dict.keys())):
                merchant_dict[province_dict[province_idx]]=[]
            elif (m["type"] == '1'):
                merchant_dict[province_dict[province_idx]].append(m["country"])
            else:
                continue


        # trading node 와 country 사이 관계
        for node in nodes_dict.values():
            # print(node.node_countries)
            for country in node.node_countries.keys():
                try:
                    home = province_dict[country_dict[country]["trade_port"]]
                    self.node_country.append({"node_name": node.name, "country_name": country, "is_home": (True if home == node.name else False), "merchant": (True if country in merchant_dict[node.name] else False), "base_trading_power": float(node.node_countries[country]["val"]), "calculated_trading_power": 0})
                except:
                    continue
        

if __name__=="__main__":
    lpg = LPGwrapper()
    lpg.generate()