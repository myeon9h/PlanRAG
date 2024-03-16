from tradenode import Node
from node_parser_graph import node_parser
from node_parser_rdb import node_value_injector
# from node_visualizer import node_visualizer
from query_generator import cql_gen, sql_gen

from src.data_parsers.locating.example_gen.parser import *
from anonymize import *
# import networkx as nx

import json, os


if __name__ == "__main__":

    anony=False

    structure_file_name = "./data/locating/raw/tradenodes.txt"
    game_savefile = "./data/locating/raw/test.eu4"
    image_path = "./outputs/locating/visual/"
    
    queries_path = "./data/locating/db_query(parsed)/"


    # print(anonyTable())
    # 노드를 만드는 코드
    nodes_dict = node_parser(structure_file_name)
    nodes_dict = node_value_injector(nodes_dict, game_savefile)

    print(nodes_dict)

    # hard negative code delete

    # Neo4j 에 넣는 코드
    cql_gen(nodes_dict,queries_path, anony= anony)
    # mysql 에 넣는 코드
    sql_gen(nodes_dict, queries_path, anony=anony, norm=False)
    

    # node_visualizer(nodes_dict, image_path+"result.png")