from tradenode import Node

from enum import Enum
import os



class State(Enum):
    LINE = 1
    NODE_REGISTER = 2
    OUT_GOING = 3
    MEMBERS = 4
    INLAND = 5


    

example_data = """ivory_coast={
	location=1466
	outgoing={
		name="carribean_trade"
		path={
			1467 1468 1579 1577 1576 1522 1520 1519 1517 1516 
		}
		control={
			2696.000000 657.000000 2431.000000 777.000000 2279.000000 894.000000 2168.000000 924.000000 2002.000000 1051.000000 1858.000000 1053.000000 1775.000000 1062.000000 1703.000000 1066.000000 1631.000000 1102.000000 
		}
	}
	outgoing={
		name="bordeaux"
		path={
			1467 1468 1470 1471 1566 1563 
		}
		control={
			2693.000000 675.000000 2498.000000 819.000000 2482.000000 1053.000000 2488.000000 1226.000000 2589.000000 1369.000000 
		}
	}
	outgoing={
		name="english_channel"
		path={
			1467 1468 1470 1471 1566 1563 
		}
		control={
			2698.000000 664.000000 2487.000000 781.000000 2447.000000 1068.000000 2433.000000 1258.000000 2599.000000 1456.000000 2758.000000 1507.000000 2845.000000 1549.000000 
		}
	}
	outgoing={
		name="sevilla"
		path={
			1467 1468 1470 1471 1566 1563 
		}
		control={
			2702.000000 692.000000 2568.000000 783.000000 2516.000000 940.000000 2548.000000 1064.000000 2617.000000 1127.000000 2641.000000 1223.000000 
		}
	}
	members={
		1164 1165 1166 1096 1793 2241 1466 1097 1098 1118 1119 1151 1163 2242 1168 1306 4078 4079 4080 1126 1139 1141 2257 2258 1147 2289 2290 2294 1111 1112 1113 1116 2239 1114 1117 2238 1167 1171 1172 1174 
	}
}"""


def node_parser(file_name):
    # file = open("./00_tradenodes.txt","r")
    file = open(file_name, 'r')
    data_list = file.readlines()
    state = State.LINE

    node = None

    nodes_dict = dict()

    for line in data_list:


        line = line.replace("\n", "")

        if line[0] != "\t" and line[0] != "}":
            assert(state == State.LINE)
            node_name = line.split("=")[0]
            node = Node(node_name)
            state = State.NODE_REGISTER
        
        elif line[0] == "}":
            assert(state == State.NODE_REGISTER)
            state = State.LINE

            nodes_dict[node_name] = node
            node = None


        elif line.replace("\t", "").split("=")[0] == "outgoing":
            assert(state == State.NODE_REGISTER)
            state = State.OUT_GOING
            

        elif line.replace("\t", "").split("=")[0] == "members":
            assert(state == State.NODE_REGISTER)
            state = State.MEMBERS

        elif line.replace("\t", "").split("=")[0] == "name":
            assert(state == State.OUT_GOING)
            state = State.NODE_REGISTER
            node.out_going.append(line.replace("\t", "").replace("\"",'').split("=")[1])

        elif state == State.MEMBERS:
            state = State.NODE_REGISTER
            node.members = line.replace("\t", "").split()

        elif line.replace("\t", "").split("=")[0] == "inland":
            assert(state == State.NODE_REGISTER)
            node.inland = True if line.split("=")[1] == "yes" else False

        else:
            # assert(0)
            continue

    file.close()
    return nodes_dict

if __name__=="__main__":
    nodes_dict = node_parser("./../../dataset/raw/00_tradenodes.txt")


    print(nodes_dict)
    print(len(nodes_dict))
    
