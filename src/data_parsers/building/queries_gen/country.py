import os
from tqdm import tqdm
from enum import Enum
import copy
import goods

PEASANTS = 0.1

class Country:
    def __init__(self, definition, number):
        self.name = definition
        self.num = number
        self.market = dict()
        self.states = [] # 주 들 정보가 연산에 필수적임.
        self.consume_by_pops = dict() # 각 재화가 pops 에 의해 요구되는 양을 양의 실수로 표현. key 는 각 재화의 정수 코드.

    def __repr__(self):
        return "country: {}, county number: {}".format(self.name, self.num)

    def market_goods_append(self, goods_code, goods_price):
        self.market[goods_code] = goods_price

class Pop:
    def __init__(self):
        self.id = None
        self.type = str()
        self.size = -1
        self.wealth = -1
        self.state = -1
        self.culture = -1
    
    def __repr__(self) -> str:
        return f"({self.id}, {self.type}, {self.size}, {self.wealth}, {self.state}, {self.culture})"



def country_extracting(file_path ,code):
    cnt = country_finder_as_code(file_path, code)

    # state_list = cnt.states
    cnt.consume_by_pops = states_consume(file_path, cnt.states)
    

    return cnt


    # file = open(file_path, "r")
    # data_list = file.readlines()

    # for line in tqdm(data_list):

# you can find country market price information by three codes. e.g. "FRA"(France), "GER"(Germany)
def country_finder_as_code(file_path, code):
    file = open(file_path, "r",encoding="UTF8")
    data_list = file.readlines()

    class State(Enum):
        NO_ACTION = 0
        PRICE_INSERTING = 1
        COUNTRY_FIND = 5
        END_ACTION = 7


    state = State.NO_ACTION
    line_num = 0
    country = None
    for line in (data_list):
        # line.replace("\n", "")
        if state == State.NO_ACTION and line == "	definition=\"{}\"\n".format(code):
            state = State.COUNTRY_FIND
            country_num = int(data_list[line_num-2].split("=")[0])
            country = Country(code, country_num)

        elif state == State.COUNTRY_FIND:
            if line == "\t\t\tgoods={\n" and data_list[line_num-1] == "\t\tcurrent_price_report={\n":
                state = State.PRICE_INSERTING


            elif "=" in line and line.split("=")[0] == "\tstates":
                state_text = line.split("=")[1]
                country.states = [int(n) for n in state_text.split()[1:-1]]
            
            elif line == "}\n":
                state = State.END_ACTION


        elif state == State.PRICE_INSERTING:
            if line == "\t\t\t}\n":
                state = State.COUNTRY_FIND
            else:
                line = line.replace("\n","")
                line = line.replace("\t","")
                line_list = line.split("=")
                country.market_goods_append(int(line_list[0]), float(line_list[1]))
        
        elif state == State.END_ACTION:
            break

        # else:
        #     assert(0)

        line_num = line_num+1
    

    
    file.close()
    return country

# state_num_list 에 따라 해당 state 에서 총 재화가 얼마나 요구되는지 평가 
def states_consume(file_path, state_num_list):
    
    result_dict = dict()
    goods_file = "./data/building/raw/goods/00_goods.txt"
    wealth_file_path = "./data/building/raw/00_buy_packages.txt"
    demand_section_file_path = "./data/building/raw/00_pop_needs.txt"
    goods_list = goods.goods_finder(goods_file)

    # 부에 따른 demand 를 정리. dict 들의 list 이며 각 dict 에는 popneed_simple_clothing 등이 key 로, 필요한 값이 value 로 제공된다. wealth =0 은 없으므로 1부터 시작.
    wealth_demand_list = [dict()]
    wealth_file = open(wealth_file_path, "r", encoding="UTF8")
    wealth_data_list = wealth_file.readlines()

    goods_register = False
    wealth_dict = dict()

    for line in (wealth_data_list):
        line = line.replace("\n", "")    
        if line == "\tgoods = {":
            goods_register = True
            wealth_dict = dict()

        elif goods_register and line != "\t}":
            line = line.replace("\t", "").replace(" ","")
            line_list = line.split("=")
            wealth_dict[line_list[0]] = int(line_list[1])

        elif goods_register:
            goods_register = False
            wealth_demand_list.append(wealth_dict)
            wealth_dict = dict()
    
    wealth_file.close()
    # 이제 wealth_demand_list 가 존재

    # popneed_simple_clothing 같은 것의 key-value 관계를 만들어둔다. key 는 sentence 이름.
    demand_section_dict = dict()
    demand_file = open(demand_section_file_path, "r", encoding="UTF8")
    demand_file_list = demand_file.readlines()

    register = True
    idx = 0
    for line in demand_file_list:
        line = line.replace("\n", "").replace(" ","")
        if "=" in line and line.split("=")[1] == "{" and register:
            demand_section_dict[line.split("=")[0]] = idx
            idx = idx+1
            register = False
        elif not register and line == "}":
            register = True
    
    demand_file.close()
    # 이제 demand_section_dict, wealth_demand_list 가 존재

    # state_pop_dict = dict()

    # for s in state_num_list:
    #     state_pop_dict[s] = []

    pop_list = []

    file = open(file_path, "r",encoding="UTF8")
    data_list = file.readlines()

    class State(Enum):
        NO_ACTION = 0
        # pop 찾기를 위한 작업들
        POP_SELECTING = 1
        POP_MINING = 2
        POP_END = 3
        
        # state 에 이들을 가져다 붙이기 위한 노력
        STATE_START = 3
        STATE_SELECTING = 5
        STATE_MINING = 6
        STATE_WEIGHT_ATTACHING = 7
        STATE_CULTURE_ATTACHING = 8

        END_ACTION = 11

    # state 찾을 때는 이걸로
# """
# states={
#     database={
# """


    state = State.NO_ACTION
    culture_dict = dict()
    # country = None
    pop = Pop()
    for line in (data_list):
    # 우선 pop 들을 전부 파악해야 함.
        if state == State.NO_ACTION and line == "pops={\n":
            state = State.POP_SELECTING

        elif state == State.POP_SELECTING:
            if "=" in line and line.split("=")[1] == "{\n" and "\t" not in line.split("=")[0]:
                state = State.POP_MINING
                pop.id = int(line.split("=")[0])
            elif line == "	}\n":
                state = State.POP_END

        elif state == State.POP_MINING:
            line = line.replace("\"","").replace("\n","").replace("\t", "")
            # print(line, pop)

            if line == "}":
                state = State.POP_SELECTING
                # state_pop_dict[pop.state].append(pop)
                if pop.size>0:
                    pop_list.append(copy.deepcopy(pop))
                

            if "=" not in line:
                continue

            leftside = line.split("=")[0]
            rightside = line.split("=")[1]
            if leftside == "type":
                pop.type = rightside
                # if rightside == "peasants":
                #     assert(0)
            elif leftside == "location":
                if int(rightside) in state_num_list:
                    pop.state = int(rightside)
                else:
                    state = State.POP_SELECTING
                    pop = Pop()
            elif leftside == "workforce":
                pop.size = int(rightside) * 4
            
            elif leftside == "culture":
                pop.culture = int(rightside)

            elif leftside == "wealth":
                pop.wealth = int(rightside)


            else:
                continue
        
        # 이제 Pop들은 전부 등록됨, POP_END 는 STATE_START 와 동일.
        elif state == State.STATE_START and line == "states={\n":
            state = State.STATE_SELECTING
            
        
        elif state == State.STATE_SELECTING:
            if line[0] != "\t" and "=" in line:
                leftside = line.split("=")[0]
                rightside = line.split("=")[1]


                if leftside == "interest_groups":
                    break

                # 만약 우리가 찾는 states 라면
                if int(leftside) in state_num_list:
                    state = State.STATE_MINING
                    weight_num = 0
                    culture_num = 0

                else:
                    continue
            else:
                continue
        
        elif state == State.STATE_MINING and line == "\tpop_needs={\n":
            state = State.STATE_CULTURE_ATTACHING

        elif state == State.STATE_CULTURE_ATTACHING:
            if '=' in line and line.split("=")[1] == "{\n" and line != "\t\t\t\t\tweights={\n" and int(line.split("=")[0]) not in culture_dict.keys():
                state = State.STATE_WEIGHT_ATTACHING
                culture_num = int(line.split("=")[0])
                weight_list = []

            elif line == "\t}\n":
                state = State.STATE_SELECTING
            
            else:
                continue


        elif state == State.STATE_WEIGHT_ATTACHING:
            if line == "\t\t}\n":
                culture_dict[culture_num] = weight_list

                state = State.STATE_CULTURE_ATTACHING

            line = line.replace("\n", "")
            if line == "\t\t\t\t\tweights={":
                weight_dict = dict()
            elif line == "\t\t\t\t\t}":
                weight_list.append(weight_dict)
            
            elif "=" in line and "{" not in line:
                weight_dict[int(line.split("=")[0])] = float(line.split("=")[1])
            else:
                continue



            
        continue

    
    # 각 재화별로 얼마나 소모되는지 양수로 작성 
    consume_dict = dict()
    for i in range(len(goods_list)):
        consume_dict[i] = 0

    pop_list
    culture_dict
    from collections import Counter

    for p in (pop_list):
        
        consume_dict = dict(Counter(consume_dict)+Counter(pops_consume(p, culture_dict, demand_section_dict, wealth_demand_list, goods_list)))


    # print(consume_dict)
    return consume_dict
    
    
    

# 하나의 pop 이 얼마나 재화를 요구하는지 평가
def pops_consume(pop: Pop, culture_dict, demand_section_dict, wealth_demand_list, goods_list):
    # print(wealth_demand_list[pop.wealth])

    demand_dict = wealth_demand_list[pop.wealth]
    culture_weight_dict = culture_dict[pop.culture]

    pop_workforce = pop.size//4
    pop_dependents = pop_workforce*3
    
    return_dict = dict()

    for demand in demand_dict.keys():
        demand_idx = demand_section_dict[demand]
        # 각각의 demand 에 대한 계산

        weight_dict = culture_weight_dict[demand_idx]

        for key in weight_dict.keys():
            # print(pop.type)

            return_dict[key] = ((pop_workforce+0.5*pop_dependents)/10000) * (PEASANTS if pop.type == "peasants" else 1)*(1/goods_list[key].base_price)*(weight_dict[key]/sum(weight_dict.values()))*demand_dict[demand]

    # print(return_dict)

    # print(demand_section_dict)
    # print(culture_dict[pop.culture])


    return return_dict