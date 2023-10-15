def situation(mode = "eu4"):
    
    if mode == "eu4":
        situation = """
A "Trading node" has a "local_value," “total_power", “outgoing”, “ingoing” and **whether it's inland**.

A "Country" has a "name", “development” and a "trade_port" (home node).

Between "Trading nodes," there can be a directional edge [UPSTREAM]. It connects from a higher node to a lower node. 

A "Country" can have a non-directional connection to a trading node. Each connection has a unique "base_trading_power" for each node. 

If a specific node is the home node of a country, that country earns profit from that node. The profit is proportional to the ”local_value” plus “ingoing” and the ratio of the country's trading power and the total trading power of that node. i.e. (local_value+ingoing)*(country_trading_power/total_trading_power)

If a specific node is upstream of a country's home node, the country moves a value to downstream node, proportional to the ratio of the country's trading power to the node's total trading power and (”local_value” + “ingoing”). In the downstream node, the moved value is increased by 1.05 times and added to the ”ingoing”.

A "Merchant" belongs to a country and can be assigned to a specific trading node. A "Merchant" belonging to a trading node adds 2 to the trading power of the country's trading node and amplifies it by 1.05 times. *If one of the edges has an inland node, the added value changes to 2+max(development/3, 50). (optional)*

If a specific trading node has more than one downstream node, and a country that doesn't have that node as its home node places a "Merchant" on the Trading node, it can decide which downstream node to move the "current_value" to. That is, the country can move a "current_value" proportional to its trading power to a specific downstream node. If no merchant is placed, when there's more than one downstream node, they lose the right to decide the direction. In other words, the country's "current_value" proportional to its trading power flows out in proportion to other outflows to the downstream nodes. If there's only one downstream node, it doesn't matter.
    """
    return situation

def strategy(mode="eu4"):
    if mode == "eu4":
        strategy = """
==========
These are the famous strategy to raise overall profit.
1. It is highly encoraged to place merchants on directly connected nodes.
2. It is advantageous to place merchants on nodes with high local value. 
    """
    return strategy

def question(country, home, examples, year="1444"):

    examples_text = ""
    count = 1
    for example in examples:
        examples_text = examples_text + "{}. {}\n".format(count,example)
        count = count+1


    question = """
================
<Question>

Assume that you are the ruler of the country named "{0}". You and your competitions are on the system of trade in {3}.
You have one merchant to work on trade system. Our home node is "{1}". where should I allocate my merchant to steer trade to "{1}"?
""".format(country, home, examples_text, year)

    return question

def goal(home):
    return f"Note that my goal is maximizing my profit on \"{home}\"."

def few_shots():
    return 