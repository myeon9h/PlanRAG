import os
from tqdm import tqdm
from enum import Enum

class Goods:
    def __init__(self, name, code):
        self.name = name
        self.num = code
        self.base_price = 0
        self.current_price = 0

        self.pop_demand = 0
        self.building_demand = 0
        self.supply = 0

    
    def price_calculate(self):

        demand = self.pop_demand + self.building_demand
        if demand == 0 and self.supply == 0:
            self.current_price  = self.base_price
        else:
            self.current_price =  self.base_price*(1+0.75*(demand-self.supply)/max(demand, self.supply))

    def lpg_format(self):
        return "CREATE (n: Goods {{name:\"{0}\", code: {1}, base_price:{2}, current_price:{3}, pop_demand:{4}}});\n".format(self.name, self.num, self.base_price, self.current_price, self.pop_demand)
    
    def sql_format(self):
        return "INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES (\"{0}\", {1}, {2}, {3}, {4});\n".format(self.name, self.num, self.base_price, self.current_price, self.pop_demand)

    def __repr__(self):
        return "GoodsName: {}, GoodsCode: {}, BasePrice: {}, CurrentPrice: {}, Pop_demand: {}, Building_demand: {}, Supply: {}".format(self.name, self.num, self.base_price, round(self.current_price, 2), round(self.pop_demand, 2), round(self.building_demand, 2), round(self.supply, 2))



# you can find price information
def goods_finder(file_path):
    file = open(file_path, "r",encoding="UTF8")
    data_list = file.readlines()

    class State(Enum):
        NO_ACTION = 0
        # PRICE_INSERTING = 1
        GOODS_FIND = 5

    goods_list = []


    state = State.NO_ACTION
    goods_code = 0
    for line in (data_list):
        # line.replace("\n", "")
        if state == State.NO_ACTION and " = {" in line:
            goods_name = line.split("=")[0].replace(" ","")
            # goods_name = lower_to_upper(goods_name)

            goods = Goods(goods_name, goods_code)
            goods_code = goods_code+1
            state = State.GOODS_FIND

        elif state == State.GOODS_FIND:
            if line == "}\n" or line == "}":
                state = State.NO_ACTION
                goods_list.append(goods)
            elif line != "\n" and line.split("=")[0] == "\tcost ":
                cost = int(line.split("=")[1].replace(" ",""))
                goods.base_price = cost


    return goods_list

# lower_case goods name 을 바꾸는 함수.
# 이를테면 lower_case -> Lower Case 로 바꿈.
def lower_to_upper(text):
    # name = text.replace("_", " ")
    if (text == "fine_art"):
        return "Fine Arts"
    wordList = text.split(" ")
    for i in range(len(wordList)):
        wordList[i] = wordList[i][0].upper()+wordList[i][1:]

    return " ".join(wordList)

# Upper Case -> upper_case
def upper_to_lower(text):
    wordList = text.split(" ")
    wordList = [w.lower() for w in wordList]
    return "_".join(wordList)