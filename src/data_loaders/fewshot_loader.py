

def locating_fewshot(technique, database_type):
    if technique == "PlanRAG":
        if database_type == "relational":
            prompt = """
Plan: 
[Step 1: Identify the trading nodes that are source of "kiev". 
 Step 2: For each of these nodes, calculate the potential increase in profit if the merchant is placed there. 
 Step 3: Compare the potential profits and identify the node that would result in the highest profit.]

Current step: Step 1
Thought: I need to identify the trading nodes that are source of "kiev". This requires accessing the "flow" table in the relational database.
Action: Relational DB
Action input: SELECT source FROM flow WHERE dest = "kiev";
Observation:
  source
0   crimea
Re-plan: N
Current step: Step 2
Thought: Now that I know "crimea" is the source node of "kiev", I need to calculate the potential increase in profit if the merchant is placed there. This requires accessing the "trade_node" and "node_country" tables in the relational database.
Action: Relational DB
Action input: SELECT local_value, ingoing, total_power FROM trade_node WHERE trade_node = "crimea";

Observation:
   local_value   ingoing  total_power
0        4.205  0.493131      816.098
Re-plan: N
Current step: Step 2
Thought: Now I have the local_value, ingoing, and total_power for the "crimea" node. I also need to know the base_trading_power of "LIT" in "crimea" to calculate the potential increase in profit.
Action: Relational DB
Action input: SELECT base_trading_power FROM node_country WHERE trade_node = "crimea" AND country_name = "LIT";

Observation:
   base_trading_power
0              85.019
Re-plan: N
Current step: Step 2
Thought: Now I have the base_trading_power of "LIT" in "crimea". I can calculate the potential increase in profit if the merchant is placed in "crimea". The profit is proportional to the ”local_value” plus “ingoing” and the ratio of the country's trading power and the total trading power of that node. i.e. (local_value+ingoing)*(country_trading_power/total_trading_power)
Action: Self thinking
Action input: Calculate the potential increase in profit if the merchant is placed in "crimea".

Observation:
The potential increase in profit if the merchant is placed in "crimea" is (4.205+0.493131)*(85.019/816.098) = 0.448.
Re-plan: N
Current step: Step 3
Thought: Now that I have calculated the potential increase in profit if the merchant is placed in "crimea", I need to compare this with the potential profits from other nodes. However, since "crimea" is the only source node of "kiev", there are no other nodes to compare with. Therefore, the merchant should be placed in "crimea".
Action: Self thinking
Action input: Compare the potential profits from different nodes.

Observation: There are no other nodes to compare with.
Re-plan: N
Thought: I now know the answer.
Final answer: The merchant should be allocated to the "crimea" trading node to maximize the profit on "kiev".
"""

        elif database_type == "graph":
            prompt = """
Plan: 
[Step 1: Identify the trading nodes that are source of "kiev", 
 Step 2: Calculate the potential profit increase for each of these nodes if a merchant is placed there, 
 Step 3: Identify the node with the highest potential profit increase]

Current step: Step 1
Thought: I need to identify the trading nodes that are source of "kiev". This will require querying the Graph DB.
Action: Graph DB
Action input: MATCH (n:Trade_node)-[r:source]->(m:Trade_node {name: "kiev"}) RETURN n.name
Observation:
        0
0  crimea
Plan: 
[Step 1: Identify the trading nodes that are source of "kiev", 
 Step 2: Calculate the potential profit increase for each of these nodes if a merchant is placed there, 
 Step 3: Identify the node with the highest potential profit increase]

Current step: Step 2
Thought: Now that I have identified the trading node "crimea" that is source of "kiev", I need to calculate the potential profit increase if a merchant is placed there. This will require querying the Graph DB to get the necessary data for the calculation.
Action: Graph DB
Action input: MATCH (n:Trade_node {name: "crimea"})-[r:source]->(m:Trade_node {name: "kiev"}), (c:Country {name: "LIT"})-[nc:NodeCountry]->(n) RETURN n.local_value, n.ingoing, nc.base_trading_power, n.total_power, c.development

Observation:
       0         1       2        3       4
0  4.205  0.493131  85.019  816.098  220.82
Plan: 
[Step 1: Identify the trading nodes that are source of "kiev", 
 Step 2: Calculate the potential profit increase for each of these nodes if a merchant is placed there, 
 Step 3: Identify the node with the highest potential profit increase]

Current step: Step 2
Thought: Now that I have the necessary data, I can calculate the potential profit increase if a merchant is placed in "crimea". The profit is proportional to the ”local_value” plus “ingoing” and the ratio of the country's trading power and the total trading power of that node. A "Merchant" belonging to a trading node adds 2 to the trading power of the country's trading node and amplifies it by 1.05 times. If one of the edges has an inland node, the added value changes to 2+max(development/3, 50).
Action: Self thinking
Action input: {'tool_input': {'type': 'string', 'content': 'Calculate the potential profit increase if a merchant is placed in "crimea".'}}

Observation:
The potential profit increase if a merchant is placed in "crimea" is 0.493131.

Plan: 
[Step 1: Identify the trading nodes that are source of "kiev", 
 Step 2: Calculate the potential profit increase for each of these nodes if a merchant is placed there, 
 Step 3: Identify the node with the highest potential profit increase]

Current step: Step 3
Thought: Now that I have calculated the potential profit increase for the trading node "crimea", I need to identify if this is the node with the highest potential profit increase. Since there is only one node source of "kiev", "crimea" is the node with the highest potential profit increase.
Action: Self thinking
Action input: {'tool_input': {'type': 'string', 'content': 'Identify the node with the highest potential profit increase.'}}


Observation:
The node with the highest potential profit increase is "crimea".

Re-plan: N

Thought: I now know the answer.
Final answer: The merchant should be allocated to the trading node "crimea" to maximize profit on "kiev".
"""
        else:
            assert(0)

    elif technique == "IterRAG":
        if database_type == "relational":
            prompt = """
Thought: 
To answer this question, I need to find the trading node that will maximize the profit for the country "LIT" when a merchant is placed there. The profit is proportional to the local_value plus ingoing and the ratio of the country's trading power and the total trading power of that node. The merchant adds 2 to the trading power of the country's trading node and amplifies it by 1.05 times. If the node is inland, the added value changes to 2+max(development/3, 50). 

First, I need to find the trading power of the country "LIT" in each trading node. Then, I need to calculate the potential profit for each node if a merchant is placed there. The node with the highest potential profit is the one where the merchant should be placed.

Action: Relational DB
Action input: 
SELECT trade_node, base_trading_power FROM node_country WHERE country_name = 'LIT';
Observation:
    trade_node  base_trading_power
0   astrakhan               3.026
1  baltic_sea               6.102
2      crimea              85.019
3        kiev             145.856
4    novgorod               2.445
Thought: 
Now I have the base trading power of the country "LIT" in each trading node. Next, I need to find the total trading power and the local value plus ingoing for each node. Then, I can calculate the potential profit for each node if a merchant is placed there. 

Action: Relational DB
Action input: 
SELECT trade_node, total_power, local_value, ingoing FROM trade_node WHERE trade_node IN ('astrakhan', 'baltic_sea', 'crimea', 'kiev', 'novgorod');

Observation:
  trade_node  total_power  local_value   ingoing
0    astrakhan      696.798        2.908  1.260690
1   baltic_sea      616.130        5.665  0.983534
2       crimea      816.098        4.205  0.493131
3         kiev      867.582        4.514  0.434130
4     novgorod      608.942        5.857  1.619080
Thought: 
Now I have the total trading power, local value, and ingoing for each trading node where the country "LIT" has a presence. I can now calculate the potential profit for each node if a merchant is placed there. The profit is proportional to the local_value plus ingoing and the ratio of the country's trading power and the total trading power of that node. The merchant adds 2 to the trading power of the country's trading node and amplifies it by 1.05 times. 

Action: Self thinking
Action input: 
Calculate the potential profit for each node if a merchant is placed there. The profit is proportional to the local_value plus ingoing and the ratio of the country's trading power and the total trading power of that node. The merchant adds 2 to the trading power of the country's trading node and amplifies it by 1.05 times. 


Observation:
The potential profit for each node if a merchant is placed there is as follows:

    trade_node  potential_profit
0   astrakhan          0.019
1  baltic_sea          0.038
2      crimea          0.448
3        kiev          0.758
4    novgorod          0.016

Thought: 
The node with the highest potential profit is "kiev". However, "kiev" is already the home node of the country "LIT". Therefore, placing a merchant there would not steer any additional trade to "kiev". The node with the next highest potential profit is "crimea". Therefore, the merchant should be placed in "crimea" to steer the maximum trade to "kiev".

Final answer: 
The merchant should be placed in "crimea" to steer the maximum trade to "kiev".
"""

        elif database_type == "graph":
            prompt = """
Thought: 
To answer this question, I need to consider the following factors:
1. The local value and ingoing of each node.
2. The total power of each node.
3. The flow from each node to "kiev".
4. The development of the country "LIT".
5. Whether the node is inland or not.

First, I need to get the local value, ingoing, total power, and whether each node is inland or not from the Graph DB. Then, I need to calculate the profit for each node. The profit is proportional to the (local_value+ingoing)*(country_trading_power/total_trading_power). If the node is inland, the added value changes to 2+max(development/3, 50). 

After that, I need to check the flow from each node to "kiev". If there is a flow, it means that the node can steer trade to "kiev". 

Finally, I will compare the profit of each node and choose the one with the highest profit as the place to allocate the merchant.

Action: Graph DB
Action input: 
MATCH (n:Trade_node) WHERE n.name IN ['crimea', 'girin', 'lubeck', 'philippines'] RETURN n.name, n.local_value, n.ingoing, n.total_power, n.is_inland
Observation:
             0      1         2         3      4
0        girin  4.450  0.001661   638.328  False
1  philippines  3.084  0.945607   550.718  False
2       crimea  4.205  0.493131   816.098  False
3       lubeck  5.818  2.864695  1206.648  False
Thought: 
Now I have the local value, ingoing, total power, and whether each node is inland or not. Next, I need to get the development of the country "LIT" and the base trading power of "LIT" in each node from the Graph DB. 

Action: Graph DB
Action input: 
MATCH (c:Country)-[r:NodeCountry]->(n:Trade_node) WHERE c.name = 'LIT' AND n.name IN ['crimea', 'girin', 'lubeck', 'philippines'] RETURN n.name, r.base_trading_power, c.development

Observation:
        0       1       2
0  crimea  85.019  220.82
Thought: 
I have the base trading power of "LIT" in "crimea" and the development of "LIT". However, I still need the base trading power of "LIT" in 'girin', 'lubeck', and 'philippines'. 

Action: Graph DB
Action input: 
MATCH (c:Country)-[r:NodeCountry]->(n:Trade_node) WHERE c.name = 'LIT' AND n.name IN ['girin', 'lubeck', 'philippines'] RETURN n.name, r.base_trading_power


Observation:
Empty DataFrame
Columns: []
Index: []
Thought: 
It seems that "LIT" does not have a base trading power in 'girin', 'lubeck', and 'philippines'. This means that "LIT" cannot steer trade from these nodes to "kiev". Therefore, the only option is to allocate the merchant to "crimea". 

Final answer: 
The merchant should be allocated to "crimea".
"""
        
        else:
            assert(0)
    else:
        assert(0)

    prompt = """
<few-shot example question>
Assume that you are the ruler of the country named \"LIT\". You and your competitions are on the system of trade in 1445.\nYou have one merchant to work on trade system. Our home node is \"kiev\". where should I allocate my merchant to steer trade to \"kiev\"?

Note that my goal is maximizing my profit on \"kiev\".
""" + prompt
    return prompt

def building_fewshot(technique, database_type):
    
    if technique == "PlanRAG":
        if database_type == "relational":
            prompt = """
Plan: [Step 1: Identify the goods_id for 'fine_art', Step 2: Identify the buildings that supply 'fine_art', Step 3: Calculate the current market price of 'fine_art', Step 4: For each building, calculate the new market price of 'fine_art' if the building's level is increased by 5, Step 5: Identify the building that results in the maximum decrease in the market price of 'fine_art'].
Current step: Step 1
Thought: To identify the buildings that supply 'fine_art', I first need to know the goods_id for 'fine_art'.
Action: Relational DB
Action input: SELECT code FROM goods WHERE goods_name = 'fine_art';
Observation:1m3m
   code
0    51
Re-plan: N
Current step: Step 2
Thought: Now that I know the goods_id for 'fine_art' is 51, I can identify the buildings that supply 'fine_art'.
Action: Relational DB
Action input: SELECT building_id FROM supply WHERE goods_id = 51;

Observation:1m3m
   building_id
0          390
Current step: Step 3
Thought: Now that I know the building that supplies 'fine_art' is 390, I can calculate the current market price of 'fine_art'.
Action: Relational DB
Action input: SELECT base_price, pop_demand FROM goods WHERE code = 51;

Observation:1m3m
   base_price  pop_demand
0       200.0     2.34418
Re-plan: N
Current step: Step 3
Thought: Now that I have the base_price and pop_demand for 'fine_art', I need to calculate the demand and supply for 'fine_art' to calculate its current market price.
Action: Relational DB
Action input: SELECT SUM(max_demand) as total_max_demand, SUM(current_input) as total_current_input FROM demand WHERE goods_id = 51;


Observation:1m3m
  total_max_demand total_current_input
0             None                None
Re-plan: Y
Plan: [Step 1: Identify the goods_id for 'fine_art', Step 2: Identify the buildings that supply 'fine_art', Step 3: Calculate the current market price of 'fine_art', Step 4: For each building, calculate the new market price of 'fine_art' if the building's level is increased by 5, Step 5: Identify the building that results in the maximum decrease in the market price of 'fine_art', Step 6: If no demand data is available, consider the pop_demand as the total demand for 'fine_art'].
Current step: Step 6
Thought: Since there is no demand data available, I will consider the pop_demand as the total demand for 'fine_art'.
Action: Self thinking
Action input: 'Consider pop_demand as total demand for fine_art'

Observation:
'Consider pop_demand as total demand for fine_art'
Re-plan: N
Current step: Step 3
Thought: Now that I have the total demand for 'fine_art', I need to calculate the supply for 'fine_art' to calculate its current market price.
Action: Relational DB
Action input: SELECT SUM(current_output) as total_current_output FROM supply WHERE goods_id = 51;


Observation:
   total_current_output
0                   2.0
Re-plan: N
Current step: Step 3
Thought: Now that I have the total supply for 'fine_art', I can calculate its current market price.
Action: Self thinking
Action input: 'Calculate current market price for fine_art'


Observation:
'Calculate current market price for fine_art'
Re-plan: N
Current step: Step 4
Thought: Now that I have the current market price for 'fine_art', I need to calculate the new market price for 'fine_art' if the building's level is increased by 5.
Action: Self thinking
Action input: 'Calculate new market price for fine_art if building level is increased by 5'


Observation:
'Calculate new market price for fine_art if building level is increased by 5'
Re-plan: N
Current step: Step 5
Thought: Now that I have the new market price for 'fine_art' if the building's level is increased by 5, I can identify the building that results in the maximum decrease in the market price of 'fine_art'.
Action: Self thinking
Action input: 'Identify the building that results in the maximum decrease in the market price of fine_art'


Observation:
'Identify the building that results in the maximum decrease in the market price of fine_art'
Re-plan: N
Thought: I now know the answer.
Final answer: The building id that should be increased a level by 5 to maximally decrease the market price of fine_art is 390.
"""

        elif database_type == "graph":
            prompt = """
Plan: [Step 1: Identify the buildings that supply fine_art, Step 2: Calculate the current price of fine_art, Step 3: For each building, calculate the new price of fine_art if the building's level is increased by 5, Step 4: Identify the building that results in the maximum decrease in the price of fine_art]
Current step: Step 1
Thought: I need to identify the buildings that supply fine_art.
Action: Graph DB
Action input: MATCH (g:Goods {name: 'fine_art'})<-[r:Supply]-(b:Building) RETURN b.id

Observation:1m3m
     0
0  390
Plan: [Step 1: Identify the buildings that supply fine_art, Step 2: Calculate the current price of fine_art, Step 3: For each building, calculate the new price of fine_art if the building's level is increased by 5, Step 4: Identify the building that results in the maximum decrease in the price of fine_art]
Current step: Step 2
Thought: I need to calculate the current price of fine_art.
Action: Graph DB
Action input: MATCH (g:Goods {name: 'fine_art'}) RETURN g.current_price


Observation:1m3m
            0
0  301.959328
Plan: [Step 1: Identify the buildings that supply fine_art, Step 2: Calculate the current price of fine_art, Step 3: For each building, calculate the new price of fine_art if the building's level is increased by 5, Step 4: Identify the building that results in the maximum decrease in the price of fine_art]
Current step: Step 3
Thought: I need to calculate the new price of fine_art if the building's level is increased by 5. This requires calculating the new supply, demand, and current price for each building.
Action: Graph DB
Action input: MATCH (g:Goods {name: 'fine_art'})<-[r:Supply]-(b:Building) SET b.level = b.level + 5 RETURN g.name, g.base_price, g.pop_demand, r.max_supply, r.current_output, b.level


Observation:1m3m
          0    1        2    3         4  5
0  fine_art  200  2.34418  2.0  0.750773  7
Plan: [Step 1: Identify the buildings that supply fine_art, Step 2: Calculate the current price of fine_art, Step 3: For each building, calculate the new price of fine_art if the building's level is increased by 5, Step 4: Identify the building that results in the maximum decrease in the price of fine_art]
Current step: Step 4
Thought: I need to identify the building that results in the maximum decrease in the price of fine_art. This requires comparing the new price of fine_art for each building with the current price.
Action: Self thinking
Action input: {'tool_input': {'type': 'string'}}


Observation:
No observation is made as the action was self-thinking.
Re-plan: N
Plan: [Step 1: Identify the buildings that supply fine_art, Step 2: Calculate the current price of fine_art, Step 3: For each building, calculate the new price of fine_art if the building's level is increased by 5, Step 4: Identify the building that results in the maximum decrease in the price of fine_art]
Current step: Step 4
Thought: I need to compare the new price of fine_art for each building with the current price to identify the building that results in the maximum decrease in the price of fine_art.
Action: Self thinking
Action input: {'tool_input': {'type': 'string'}}


Observation:
No observation is made as the action was self-thinking.
Re-plan: N
Thought: I now know the answer.
Final answer: The building with id 390 should be increased a level by 5 to maximally decrease the market price of fine_art.
"""
        else:
            assert(0)

    elif technique == "IterRAG":
        if database_type == "relational":
            prompt = """
Thought: To answer this question, we need to find out which building's level increase will lead to a decrease in the market price of 'fine_art'. This means we need to find a building that produces 'fine_art'. Increasing the level of this building will increase the supply of 'fine_art', which in turn will decrease its market price according to the given formula. So, first, we need to find the code of 'fine_art' from the goods table. Then, we will find the building id that produces 'fine_art' from the supply table. 
Action: Relational DB
Action input: SELECT code FROM goods WHERE goods_name = 'fine_art';
Observation:
   code
0    51
Thought: Now that we have the code for 'fine_art', we can use it to find the building ids that produce 'fine_art' from the supply table. We need to find the building that, if its level is increased, will lead to the greatest increase in the supply of 'fine_art'. This means we need to find the building with the highest 'max_supply' for 'fine_art'. 
Action: Relational DB
Action input: SELECT building_id, max_supply FROM supply WHERE goods_id = 51 ORDER BY max_supply DESC LIMIT 1;

Observation:1m3m
   building_id  max_supply
0          390         2.0
Thought: Now that we have the building id that produces the most 'fine_art', we can conclude that increasing the level of this building will lead to the greatest increase in the supply of 'fine_art', and thus the greatest decrease in its market price.
Final answer: The building id we should increase a level for decreasing the market price of fine_art is 390.
"""

        elif database_type == "graph":
            prompt = """
Thought: To answer this question, I need to find out which building's level increase will lead to the maximum decrease in the market price of 'fine_art'. This involves calculating the change in supply and demand of 'fine_art' if the level of each building is increased by 5, and then calculating the new price. The building that results in the largest price decrease is the one we're looking for. 

First, I need to find all the buildings that are connected to 'fine_art' through the Supply and Demand relationships. I will also separate the queries for Demand and Supply to make the process clearer.

Action: Graph DB
Action input: MATCH (g:Goods {name: 'fine_art'})-[r:Demand]->(b:Building) RETURN b.id, r.max_demand, r.current_input, b.level
Observation:1m3m
Empty DataFrame
Columns: []
Index: []
Thought: It seems there are no buildings connected to 'fine_art' through the Demand relationship. Now, I will check the buildings connected through the Supply relationship.

Action: Graph DB
Action input: MATCH (g:Goods {name: 'fine_art'})<-[r:Supply]-(b:Building) RETURN b.id, r.max_supply, r.current_output, b.level

Observation:1m3m
     0    1         2  3
0  390  2.0  0.750773  2
Thought: There is only one building connected to 'fine_art' through the Supply relationship. This building has an id of 390, a max_supply of 2, a current_output of 0.750773, and a level of 2. 

Now, I need to calculate the new supply of 'fine_art' if the level of this building is increased by 5. According to the rules, the max_supply and level have a proportional relationship, so the new max_supply will be (2/2)*7 = 7. The current_output is determined by the average ratio of the connected Building's current_input to connected Goods' max_demand, and multiplied by the max_supply of Supply. However, since there are no buildings connected to 'fine_art' through the Demand relationship, the current_input and max_demand are both 0, so the new current_output will also be 0.

Next, I need to calculate the new price of 'fine_art' if the supply changes. The current_price of Goods is determined by base_price*(1+0.75(demand-supply)/max(demand,supply)). Since the demand does not change, I only need to find the base_price and pop_demand of 'fine_art' to calculate the new price.

Action: Graph DB
Action input: MATCH (g:Goods {name: 'fine_art'}) RETURN g.base_price, g.pop_demand


Observation:1m3m
     0        1
0  200  2.34418
Thought: The base_price of 'fine_art' is 200 and the pop_demand is 2.34418. Since there are no buildings connected to 'fine_art' through the Demand relationship, the demand of 'fine_art' is equal to its pop_demand, which is 2.34418. The new supply is 0. 

Now, I can calculate the new price of 'fine_art' if the level of building 390 is increased by 5. The new price will be 200*(1+0.75*(2.34418-0)/max(2.34418,0)) = 200*(1+0.75*2.34418/2.34418) = 200*1.75 = 350.

The building id that we should increase a level by 5 to maximally decrease the market price of fine_art is 390.

Thought: I now know the answer.
Final answer: The building id that we should increase a level by 5 to maximally decrease the market price of fine_art is 390.
"""
        else:
            assert(0)
    else:
        assert(0)

    
    return prompt

def fewshot_loader(technique, scenario, database_type):
    if scenario == "locating":
        return locating_fewshot(technique=technique,database_type=database_type)
    elif scenario == "building":
        return building_fewshot(technique=technique,database_type=database_type)
    else:
        assert(0)