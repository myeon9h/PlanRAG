from tradenode import Node
from node_parser_graph import node_parser
from node_parser_rdb import node_value_injector
from node_visualizer import node_visualizer
from query_generator import cql_gen, sql_gen

from src.data_parsers.trading.example_gen.parser import *
from anonymize import *
import networkx as nx

import json, os


if __name__ == "__main__":

    anony=False

    structure_file_name = "./data/trading/raw/tradenodes.txt"
    game_savefile = "./data/trading/raw/(1445case)Castile_research_1445_02.eu4"
    image_path = "./outputs/trading/visual/"
    
    queries_path = "./data/trading/db_query(parsed)/"


    # print(anonyTable())
    # 노드를 만드는 코드
    nodes_dict = node_parser(structure_file_name)
    nodes_dict = node_value_injector(nodes_dict, game_savefile)

    print(nodes_dict)

    # hard negative check
    if False:
        file = open("./data/trading/questions/standard/questions.json", "r")
        questions = json.load(file)
        
        right_hn = 0
        right_sn = 0

        wrong = [2,3,5,12,15,27, 29,38,42,44,45,48]
        wrong_hn = 0
        wrong_sn = 0

        idx = 1
        for q in questions:
            home = q["home"]
            hn = -1
            sn = 0
            for ex in q["examples"]:
                if ex in nodes_dict[home].out_going:
                    sn = sn+1
                elif home in nodes_dict[ex].out_going:
                    hn = hn + 1

            

            if idx in wrong:
                wrong_hn = wrong_hn + hn
                wrong_sn = wrong_sn + sn
            else:
                right_hn = right_hn + hn
                right_sn = right_sn + sn

            print(f"q{idx} hn: {hn}, sn: {sn}")
            idx = idx + 1
        

        print(f"avg hn right: {right_hn/(50-len(wrong))}, avg sn right: {right_sn/(50-len(wrong))}")
        print(f"avg hn wrong: {wrong_hn/(len(wrong))}, avg sn right: {wrong_sn/(len(wrong))}")



        exit()

    
    # file = open("./data/trading/questions/anonymized/anonyTable.json", "w")
    
    # json.dump(anonyTable(), file, indent=4)
    
    # file.close()

    # Neo4j 에 넣는 코드
    cql_gen(nodes_dict,queries_path, anony= anony)
    # mysql 에 넣는 코드
    sql_gen(nodes_dict, queries_path, anony=anony, norm=False)
    

    node_visualizer(nodes_dict, image_path+"result.png")