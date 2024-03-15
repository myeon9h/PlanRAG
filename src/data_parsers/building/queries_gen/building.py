import goods
import os
from tqdm import tqdm
from enum import Enum
import copy


class Building:
    def __init__(self) -> None:
        
        # id
        self.id = -1
        self.name = str()
        self.current_input = dict()
        self.current_output = dict()

        self.max_demand = dict()
        self.max_supply = dict()

        self.level = -1
        self.throughput = -1

        self.state = -1

    def current_output_calculation(self):
        demand_output_list = [min(self.current_input[c_i], self.max_demand[c_i])/self.max_demand[c_i] for c_i in self.current_input.keys()]
        
        if len(demand_output_list) == 0:
            return

        demand_output_ratio = sum(demand_output_list)/len(demand_output_list)


        for c_i in self.max_supply.keys():
            self.current_output[c_i] = self.max_supply[c_i]*demand_output_ratio
        
        return
    
    def level_change(self, level):

        old_level = self.level
        self.level = level
        for d in self.max_demand.keys():
            self.max_demand[d] = float((level/old_level)*self.max_demand[d])
        
        for s in self.max_supply.keys():
            self.max_supply[s] = float((level/old_level)*self.max_supply[s])


        return

    def lpg_format(self):
        query = "CREATE (n: Building {{id: {0}, name:\"{1}\", level:{4}}});\n".format(self.id, self.name, self.max_demand, self.max_supply, self.level)

        # demand
        for d in self.max_demand.keys():
            query = query + "MATCH (g: Goods{{code: {0}}}), (b: Building{{id:{1}}}) CREATE (g)-[r:Demand{{max_demand: {2}, current_input: {4}, level: {3}}}]->(b);\n".format(d, self.id, self.max_demand[d], self.level, self.current_input[d])
        
        # supply
        for s in self.current_output.keys():
            query = query + "MATCH (g: Goods{{code: {0}}}), (b: Building{{id:{1}}}) CREATE (b)-[r:Supply{{max_supply: {2}, current_output: {4},level: {3}}}]->(g);\n".format(s, self.id, self.max_supply[s], self.level, self.current_output[s])

        return query
    
    def sql_format(self):
        query = "INSERT INTO building(id, name, level) VALUES ({0}, \"{1}\", {2});\n".format(self.id, self.name, self.level)

        # demand
        for d in self.max_demand.keys():
            query = query + "INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES ({0}, {1}, {2}, {3}, {4});\n".format(d, self.id, self.max_demand[d], self.level, self.current_input[d])
        
        # supply
        for s in self.current_output.keys():
            query = query + "INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES ({0}, {1}, {2}, {3}, {4});\n".format(s, self.id, self.max_supply[s], self.level, self.current_output[s])

        return query

    def __repr__(self) -> str:
        return f"[{self.id}, {self.name}, {self.max_demand}, {self.max_supply}, {self.level}, {self.throughput}, {self.state}]"


def extract_building(file_path= "./data/building/raw/test.v3"):

    building_dict = dict()
    file = open(file_path, "r",encoding="UTF8")
    data_list = file.readlines()

    class State(Enum):
        NO_ACTION = 0
        BUILDING_FINDING = 1
        BUILDING_REGISTER = 2
        BUILDING_INPUT_GOODS = 3
        BUILDING_OUTPUT_GOODS = 4
        BUILDING_INPUT_GOODS_REGISTER = 5
        BUILDING_OUTPUT_GOODS_REGISTER = 6
        END_ACTION = 7


    state = State.NO_ACTION
    for line in (data_list):
        # line.replace("\n", "")
        if state == State.NO_ACTION and line == "building_manager={\n":
            state = State.BUILDING_FINDING
            # country_num = int(data_list[line_num-2].split("=")[0])
            # country = Country(code, country_num)

        elif state == State.BUILDING_FINDING:
            if "\t" not in line and "=" in line:
                building = Building()
                building.id = int(line.split("=")[0])
                state = State.BUILDING_REGISTER
            elif line == "}\n":
                state = State.END_ACTION

            else:
                continue


        elif state == State.BUILDING_REGISTER:
            if line == "}\n":
                for i in building.current_input.keys():
                    building.max_demand[i] = ((building.current_input[i]/building.throughput) if building.throughput > 0 else building.current_input[i])
                    if building.max_demand[i] <= 0:
                        assert(0)
                for j in building.current_output.keys():
                    building.max_supply[j] = (building.current_output[j]/building.throughput) if building.throughput > 0 else building.current_output[j]
                
                if building.state >0:
                    building_dict[building.id] = (building)
                    
                    assert(building.level != -1)


                state = State.BUILDING_FINDING
                continue
                
            if "=" in line:
                line = line.replace("\t", "").replace("\n","")
                leftside = line.split("=")[0]
                rightside = line.split("=")[1]
                if leftside == "building":
                    building.name = rightside.split()[0]
                    try:
                        building.level = int(line.split("=")[2])
                    except:
                        pass
                    
                    if int(building.level) == 0:
                        state=State.BUILDING_FINDING
                        # there is no level-zero building.

                elif leftside == "level":
                    if int(rightside) == 0:
                        state=State.BUILDING_FINDING
                    else:
                        building.level = int(rightside)

                elif leftside == "state":
                    building.state = int(rightside)
                
                elif leftside == "input_goods":
                    state = State.BUILDING_INPUT_GOODS
                
                elif leftside == "output_goods":
                    state = State.BUILDING_OUTPUT_GOODS
                
                elif leftside == "throughput":
                    building.throughput = float(rightside)
                


            else:
                continue

        elif state == State.BUILDING_INPUT_GOODS:
            if line == "\t\tgoods={\n":
                state = State.BUILDING_INPUT_GOODS_REGISTER
                input_dict = dict()
            elif line == "\t}\n":
                state = State.BUILDING_REGISTER
                building.current_input = copy.deepcopy(input_dict)
            else:
                continue

        elif state == State.BUILDING_INPUT_GOODS_REGISTER:
            if line == "\t\t}\n":
                state = State.BUILDING_INPUT_GOODS
                building.current_input = copy.deepcopy(input_dict)
            else:
                assert("=" in line)
                line = line.replace("\n", "").replace("\t", "")

                leftside = line.split("=")[0]
                rightside = line.split("=")[1]
                
                if float(rightside) != 0:
                    input_dict[int(leftside)] = float(rightside)



        elif state == State.BUILDING_OUTPUT_GOODS:
            if line == "\t\tgoods={\n":
                state = State.BUILDING_OUTPUT_GOODS_REGISTER
                output_dict = dict()
            elif line == "\t}\n":
                state = State.BUILDING_REGISTER
                building.current_output = copy.deepcopy(output_dict)
            else:
                continue

        elif state == State.BUILDING_OUTPUT_GOODS_REGISTER:
            if line == "\t\t}\n":
                state = State.BUILDING_OUTPUT_GOODS
                building.current_output = copy.deepcopy(output_dict)
            else:
                assert("=" in line)
                line = line.replace("\n", "").replace("\t", "")

                leftside = line.split("=")[0]
                rightside = line.split("=")[1]
                if float(rightside) != 0:
                    output_dict[int(leftside)] = float(rightside)
                else:
                    continue


        elif state == State.END_ACTION:
            break

    

    
    file.close()


    return building_dict

if __name__ == "__main__":

    game_savefile = "./data/building/raw/raw1849.v3"
    print(extract_building(game_savefile))