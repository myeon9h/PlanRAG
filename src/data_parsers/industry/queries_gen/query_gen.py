# this file generates sql and cypher query from csv file
# 임시방편

import pandas as pd
from goods import Goods, goods_finder, lower_to_upper


def sql_gen(csv_path):
    f = open(csv_path, 'r')
    df = pd.read_csv(f)

    rows = list()

    context = """
CREATE TABLE general
(
    name VARCHAR(20),
    current_price FLOAT,
    base_price FLOAT,
    changes_as_percent VARCHAR(10),
    CONSTRAINT name PRIMARY KEY (name)
);
    """

    goods_list = goods_finder("./data/industry/raw/goods/00_goods.txt")


    for idx, row in df.iterrows():
        rows.append(dict(row))

    for r in rows:
        # 여기서 이름은 upper 임.
        name = r["Goods"]
        current = r["Market Price"]
        changes= r["Compared to Base Price"]

        base_price = None
        for goods in goods_list:
            if goods.name == name:
                base_price = goods.base_price
            else:
                continue

        context = context + f"INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES(\"{name}\", {current}, {base_price}, \"{changes}\");\n"

    # context = context + ";"

    f.close()


    sql_path = csv_path.replace(".csv", "")+".sql"
    f = open(sql_path, 'w')
    f.write(context)
    f.close()
    
    return context

def cypher_gen(csv_path):

    f = open(csv_path, 'r')
    df = pd.read_csv(f)

    nodes = set()
    rows = list()

    context = ""

    for idx, row in df.iterrows():
        nodes = nodes.union({row['Goods Consumption'], row["Goods Production"]})
        rows.append(dict(row))

    for n in nodes:
        context = context + f"CREATE (a:Goods{{name:\"{n}\"}});\n"

    # a-[r:makes{name: "Building"}]->b
    for r in rows:
        head = r["Goods Consumption"]
        tail = r["Goods Production"]
        relationship = r["Building"]
        context = context + f"MATCH (a: Goods{{name:\"{head}\"}}), (b: Goods{{name:\"{tail}\"}}) CREATE (a)-[r:makes{{name:\"{relationship}\"}}]->(b);\n"

    context = context + ";"

    f.close()

    cql_path = csv_path.replace(".csv", "")+".cql"
    f = open(cql_path, 'w')
    f.write(context)
    f.close()
    pass



if __name__ == "__main__":
    for i in range(1, 4):
        cypher_gen(f"./data/industry/queries/2-hop/00{i}_2-hop_gdb_table.csv")
        sql_gen(f"./data/industry/queries/2-hop/00{i}_2-hop_rdb.csv")
    # print(result)
    pass