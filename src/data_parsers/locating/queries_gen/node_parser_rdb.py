from tradenode import Node
from tqdm import tqdm
from enum import Enum
import os



class State(Enum):
    NO_ACTION = 0
    LINE = 1
    NODE_FIND = 2
    NODE_REGISTER = 3
    VALUES = 4
    COUNTRY_FIND = 5
    COUNTRY = 6
    END_ACTION = 7
    COUNTRY_TTO =8


class MerchantState(Enum):
    LINE = 1
    MERCHANT_REGISTER = 2




def node_value_injector(nodes_dict, save_file):
    file = open(save_file,"r")
    data_list = file.readlines()

    count  = 0
    state = State.NO_ACTION
    current_node = None

    # 나라를 세 문자로 표현한 것을 의미
    country_three = None

    current_country_dict = None

    def line_err(line_count):
        (lambda line_count: "error on line {}".format(line_count))(line_count)
        assert(0)

    for line in tqdm(data_list):
        line = line.replace("\n", "")
        count  = count +1
        if state == State.NO_ACTION:
            if (line == "trade={"):
                state = State.LINE
                continue
            else:
                continue
        
        elif state == State.END_ACTION:
            continue
        
        elif state == State.LINE:
            if (line == "\tnode={"):
                state = State.NODE_FIND
                continue
            elif(line == "}"):
                state = State.END_ACTION
                continue
            else:
                line_err(count)
        
        elif state == State.NODE_FIND:
            line_list = line.replace("\t", "").replace("\"",'').split("=")
            if (line_list[0] == "definitions"):
                current_node = nodes_dict[line_list[1]]
                state = State.NODE_REGISTER
                continue

            else:
                line_err(count)

        elif state == State.NODE_REGISTER:
            if (line == "\t}"):
                state = State.LINE
                continue

            line_list = line.replace("\t", "").replace("\"",'').split("=")
            # =이 없는 경우
            if (len(line_list) == 1):
                continue
            # 중괄호를 열지 않는 경우
            if (line_list[1][0] != "{"):
                state = State.NODE_REGISTER
                current_node.node_values[line_list[0]]=line_list[1]
                continue
                
            # 중괄호를 열고 앞이 대문자인 경우
            if(line_list[0].isupper and len(line_list[0])==3):
                state = State.COUNTRY_FIND
                country_three = line_list[0]
                continue
            else:
                continue
                # line_err(count)


        elif state == State.COUNTRY_FIND:
            line_list = line.replace("\t", "").replace("\"",'').split("=")

            if (line_list[0] == "max_demand"):
                state = State.NODE_REGISTER
                continue
            else:
                state = State.COUNTRY
                current_country_dict = dict()
                current_country_dict[line_list[0]]=line_list[1]

                continue
        
        elif state == State.COUNTRY:
            line_list = line.replace("\t", "").replace("\"",'').split("=")

            if (len(line_list) == 1):
                state = State.NODE_REGISTER
                current_node.node_countries[country_three] = current_country_dict
                continue
            elif (line_list[1] == '{'):
                state = State.COUNTRY_TTO
                continue
            
            else:
                state = State.COUNTRY
                current_country_dict[line_list[0]]=line_list[1]
                continue
            
        # 우리는 t_to 를 모두 제거했다 (아마도 무역력 이송인 것 같다. t_out 으로 대체)
        elif state == State.COUNTRY_TTO:
            if (line.replace("\t","") == "}"):
                state = State.COUNTRY
                continue
            else:
                continue

    file.close()
    return nodes_dict

def merchant_parser(file_name="./data/locating/raw/(1445case)Castile_research_1445_02.eu4"):
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
    # nodes_dict = node_value_injector("./dataset/Castile_research_1445_02.eu4")


    # print(nodes_dict)
    # print(len(nodes_dict))
    print(len(merchant_parser()))
    pass
