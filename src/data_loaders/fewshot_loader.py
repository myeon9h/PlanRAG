

def locating_fewshot(technique, database_type):
    if technique == "PlanRAG":
        if database_type == "relational":
            prompt = """
Plan: 
[Step 1: Identify the trading nodes that are upstream of "kiev". 
 Step 2: For each of these nodes, calculate the potential increase in profit if the merchant is placed there. 
 Step 3: Compare the potential profits and identify the node that would result in the highest profit.]

Current step: Step 1
Thought: I need to identify the trading nodes that are upstream of "kiev". This requires accessing the "flow" table in the relational database.
Action: Relational DB
Action input: SELECT upstream FROM flow WHERE downstream = "kiev";
Observation:
  upstream
0   crimea
Re-plan: N
Current step: Step 2
Thought: Now that I know "crimea" is the upstream node of "kiev", I need to calculate the potential increase in profit if the merchant is placed there. This requires accessing the "trading_node" and "node_country" tables in the relational database.
Action: Relational DB
Action input: SELECT local_value, ingoing, total_power FROM trading_node WHERE trading_node = "crimea";

Observation:
   local_value   ingoing  total_power
0        4.205  0.493131      816.098
Re-plan: N
Current step: Step 2
Thought: Now I have the local_value, ingoing, and total_power for the "crimea" node. I also need to know the base_trading_power of "LIT" in "crimea" to calculate the potential increase in profit.
Action: Relational DB
Action input: SELECT base_trading_power FROM node_country WHERE node_name = "crimea" AND country_name = "LIT";

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
Thought: Now that I have calculated the potential increase in profit if the merchant is placed in "crimea", I need to compare this with the potential profits from other nodes. However, since "crimea" is the only upstream node of "kiev", there are no other nodes to compare with. Therefore, the merchant should be placed in "crimea".
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
[Step 1: Identify the trading nodes that are upstream of "kiev", 
 Step 2: Calculate the potential profit increase for each of these nodes if a merchant is placed there, 
 Step 3: Identify the node with the highest potential profit increase]

Current step: Step 1
Thought: I need to identify the trading nodes that are upstream of "kiev". This will require querying the Graph DB.
Action: Graph DB
Action input: MATCH (n:Trade_node)-[r:UPSTREAM]->(m:Trade_node {name: "kiev"}) RETURN n.name
Observation:
        0
0  crimea
Plan: 
[Step 1: Identify the trading nodes that are upstream of "kiev", 
 Step 2: Calculate the potential profit increase for each of these nodes if a merchant is placed there, 
 Step 3: Identify the node with the highest potential profit increase]

Current step: Step 2
Thought: Now that I have identified the trading node "crimea" that is upstream of "kiev", I need to calculate the potential profit increase if a merchant is placed there. This will require querying the Graph DB to get the necessary data for the calculation.
Action: Graph DB
Action input: MATCH (n:Trade_node {name: "crimea"})-[r:UPSTREAM]->(m:Trade_node {name: "kiev"}), (c:Country {name: "LIT"})-[nc:NodeCountry]->(n) RETURN n.local_value, n.ingoing, nc.base_trading_power, n.total_power, c.development

Observation:
       0         1       2        3       4
0  4.205  0.493131  85.019  816.098  220.82
Plan: 
[Step 1: Identify the trading nodes that are upstream of "kiev", 
 Step 2: Calculate the potential profit increase for each of these nodes if a merchant is placed there, 
 Step 3: Identify the node with the highest potential profit increase]

Current step: Step 2
Thought: Now that I have the necessary data, I can calculate the potential profit increase if a merchant is placed in "crimea". The profit is proportional to the ”local_value” plus “ingoing” and the ratio of the country's trading power and the total trading power of that node. A "Merchant" belonging to a trading node adds 2 to the trading power of the country's trading node and amplifies it by 1.05 times. If one of the edges has an inland node, the added value changes to 2+max(development/3, 50).
Action: Self thinking
Action input: {'tool_input': {'type': 'string', 'content': 'Calculate the potential profit increase if a merchant is placed in "crimea".'}}

Observation:
The potential profit increase if a merchant is placed in "crimea" is 0.493131.

Plan: 
[Step 1: Identify the trading nodes that are upstream of "kiev", 
 Step 2: Calculate the potential profit increase for each of these nodes if a merchant is placed there, 
 Step 3: Identify the node with the highest potential profit increase]

Current step: Step 3
Thought: Now that I have calculated the potential profit increase for the trading node "crimea", I need to identify if this is the node with the highest potential profit increase. Since there is only one node upstream of "kiev", "crimea" is the node with the highest potential profit increase.
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
SELECT node_name, base_trading_power FROM node_country WHERE country_name = 'LIT';
Observation:
    node_name  base_trading_power
0   astrakhan               3.026
1  baltic_sea               6.102
2      crimea              85.019
3        kiev             145.856
4    novgorod               2.445
Thought: 
Now I have the base trading power of the country "LIT" in each trading node. Next, I need to find the total trading power and the local value plus ingoing for each node. Then, I can calculate the potential profit for each node if a merchant is placed there. 

Action: Relational DB
Action input: 
SELECT trading_node, total_power, local_value, ingoing FROM trading_node WHERE trading_node IN ('astrakhan', 'baltic_sea', 'crimea', 'kiev', 'novgorod');

Observation:
  trading_node  total_power  local_value   ingoing
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

    node_name  potential_profit
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
MATCH (n:Trade_node) WHERE n.name IN ['crimea', 'girin', 'lubeck', 'philippines'] RETURN n.name, n.local_value, n.ingoing, n.total_power, n.node_inland
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
Plan: [Step 1: Identify the code for sulfur in the goods table, Step 2: Identify the buildings that supply sulfur, Step 3: Calculate the potential increase in supply for each building if their level was increased by 5, Step 4: Calculate the potential decrease in price for each building, Step 5: Identify the building that would result in the maximum decrease in price]
Current step: Step 1
Thought: I need to find the code for sulfur in the goods table.
Action: Relational DB
Action input: SELECT code FROM goods WHERE goods_name = 'sulfur';
Observation:
   code
0    22
Re-plan: N
Current step: Step 2
Thought: Now that I have the code for sulfur, I need to identify the buildings that supply sulfur.
Action: Relational DB
Action input: SELECT building_id FROM supply WHERE goods_id = 22;
Observation:
   building_id
0          319
Plan: [Step 1: Identify the code for sulfur in the goods table, Step 2: Identify the buildings that supply sulfur, Step 3: Calculate the potential increase in supply for each building if their level was increased by 5, Step 4: Calculate the potential decrease in price for each building, Step 5: Identify the building that would result in the maximum decrease in price]
Current step: Step 3
Thought: Now that I have the building that supplies sulfur, I need to calculate the potential increase in supply if the building's level was increased by 5.
Action: Relational DB
Action input: SELECT max_supply, level FROM supply WHERE goods_id = 22 AND building_id = 319;

Observation:
   max_supply  level
0        40.0      3
Re-plan: N
Current step: Step 4
Thought: Now that I have the current max_supply and level of the building, I need to calculate the potential increase in supply if the building's level was increased by 5. Since max_supply and level have a proportional relationship, the new max_supply would be (max_supply/level)*(level+5).
Action: Self thinking
Action input: (40.0/3)*(3+5)

Observation:
106.66666666666667
Re-plan: N
Current step: Step 4
Thought: Now that I have the potential increase in supply, I need to calculate the potential decrease in price. For this, I need to know the current demand, supply, and base price of sulfur.
Action: Relational DB
Action input: SELECT base_price, pop_demand FROM goods WHERE code = 22;

Observation:
   base_price  pop_demand
0        50.0         0.0
Re-plan: Y
Plan: [Step 1: Identify the code for sulfur in the goods table, Step 2: Identify the buildings that supply sulfur, Step 3: Calculate the potential increase in supply for each building if their level was increased by 5, Step 4: Calculate the current demand and supply of sulfur, Step 5: Calculate the potential decrease in price for each building, Step 6: Identify the building that would result in the maximum decrease in price]
Current step: Step 4
Thought: Now that I have the base price and pop_demand of sulfur, I need to calculate the current demand and supply of sulfur. The demand of sulfur is defined as the Goods' "pop_demand" plus sum of the "max_demand" of all Demands connected to the Goods. The supply of sulfur is defined by the sum of "current_output" of all Supplies connected to sulfur.
Action: Relational DB
Action input: SELECT SUM(max_demand) as total_max_demand FROM demand WHERE goods_id = 22; SELECT SUM(current_output) as total_current_output FROM supply WHERE goods_id = 22;


Observation:
An exception occured: (pymysql.err.ProgrammingError) (1064, "You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELECT SUM(current_output) as total_current_output FROM supply WHERE goods_id = ' at line 1")
[SQL: SELECT SUM(max_demand) as total_max_demand FROM demand WHERE goods_id = 22; SELECT SUM(current_output) as total_current_output FROM supply WHERE goods_id = 22;

]
(Background on this error at: https://sqlalche.me/e/20/f405)
Re-plan: Y
Plan: [Step 1: Identify the code for sulfur in the goods table, Step 2: Identify the buildings that supply sulfur, Step 3: Calculate the potential increase in supply for each building if their level was increased by 5, Step 4: Calculate the current demand of sulfur, Step 5: Calculate the current supply of sulfur, Step 6: Calculate the potential decrease in price for each building, Step 7: Identify the building that would result in the maximum decrease in price]
Current step: Step 4
Thought: Now that I have the base price and pop_demand of sulfur, I need to calculate the current demand of sulfur. The demand of sulfur is defined as the Goods' "pop_demand" plus sum of the "max_demand" of all Demands connected to the Goods.
Action: Relational DB
Action input: SELECT SUM(max_demand) as total_max_demand FROM demand WHERE goods_id = 22;
Observation:
   total_max_demand
0             150.0
Re-plan: N
Current step: Step 5
Thought: Now that I have the total max_demand for sulfur, I can calculate the current demand of sulfur by adding the pop_demand to the total max_demand. Next, I need to calculate the current supply of sulfur. The supply of sulfur is defined by the sum of "current_output" of all Supplies connected to sulfur.
Action: Relational DB
Action input: SELECT SUM(current_output) as total_current_output FROM supply WHERE goods_id = 22;

Observation:
   total_current_output
0                   1.0
Re-plan: N
Current step: Step 6
Thought: Now that I have the total current_output for sulfur, I can calculate the current supply of sulfur. Next, I need to calculate the potential decrease in price if the building's level was increased by 5. The "current_price" of Goods is determined by base_price*(1+0.75(demand-supply)/max(demand,supply)).
Action: Self thinking
Action input: 50*(1+0.75*((150+0)-(1+106.66666666666667))/max((150+0),(1+106.66666666666667)))


Observation:
50.0
Re-plan: N
Current step: Step 7
Thought: Now that I have calculated the potential decrease in price if the building's level was increased by 5, I need to identify the building that would result in the maximum decrease in price. In this case, there is only one building that supplies sulfur, so the building id is 319.
Action: Self thinking
Action input: 319


Observation:
319
Re-plan: N
Thought: I now know the answer.
Final answer: The building id that we should increase a level by 5 to maximally decrease the market price of sulfur is 319.
"""

        elif database_type == "graph":
            prompt = """
Plan: [Step 1: Retrieve the building ids that are connected to sulfur via the Supply relationship, Step 2: For each building id, calculate the new current_output if the building level is increased by 5, Step 3: For each building id, calculate the new supply of sulfur if the building level is increased by 5, Step 4: For each building id, calculate the new current_input of all Demands connected to sulfur, Step 5: For each building id, calculate the new demand of sulfur, Step 6: For each building id, calculate the new current_price of sulfur, Step 7: Compare the new current_prices and find the building id that leads to the lowest current_price].
Current step: Step 1
Thought: I need to find all the buildings that supply sulfur.
Action: Graph DB
Action input: MATCH (g:Goods {name: 'sulfur'})<-[r:Supply]-(b:Building) RETURN b.id

Observation:
     0
0  319
Current step: Step 2
Thought: Now I need to calculate the new current_output for building 319 if its level is increased by 5.
Action: Graph DB
Action input: MATCH (b:Building {{id: 319}})-[r:Supply]->(g:Goods {name: 'sulfur'}) RETURN r.current_output * (b.level + 5) / b.level


Observation:
           0
0  20.304418
Current step: Step 3
Thought: Now I need to calculate the new supply of sulfur if the level of building 319 is increased by 5.
Action: Graph DB
Action input: MATCH (g:Goods {name: 'sulfur'})<-[r:Supply]-(b:Building) WITH SUM(r.current_output * (CASE WHEN b.id = 319 THEN (b.level + 5) / b.level ELSE 1 END)) AS new_supply RETURN new_supply


Observation:
           0
0  20.304418
Current step: Step 4
Thought: Now I need to calculate the new current_input of all Demands connected to sulfur if the level of building 319 is increased by 5.
Action: Graph DB
Action input: MATCH (g:Goods {name: 'sulfur'})-[r:Demand]->(b:Building) RETURN r.max_demand * 20.304418 / (g.pop_demand + SUM(r.max_demand))


Observation:
           0
0  20.304418
1  20.304418
2  20.304418
Current step: Step 5
Thought: Now I need to calculate the new demand of sulfur if the level of building 319 is increased by 5.
Action: Graph DB
Action input: MATCH (g:Goods {name: 'sulfur'})-[r:Demand]->(b:Building) RETURN g.pop_demand + SUM(r.max_demand)


Observation:
       0
0  150.0
Current step: Step 6
Thought: Now I need to calculate the new current_price of sulfur if the level of building 319 is increased by 5.
Action: Graph DB
Action input: MATCH (g:Goods {name: 'sulfur'}) RETURN g.base_price*(1+0.75*(150-20.304418)/MAX(150,20.304418))


Observation:An exception occured: {{code: Neo.ClientError.Statement.SyntaxError}} {message: Too many parameters for function 'max' (line 1, column 78 (offset: 77))
"MATCH (g:Goods {name: 'sulfur'}) RETURN g.base_price*(1+0.75*(150-20.304418)/MAX(150,20.304418))"
                                                                              ^}
Re-plan: Y
New Plan: [Step 1: Retrieve the building ids that are connected to sulfur via the Supply relationship, Step 2: For each building id, calculate the new current_output if the building level is increased by 5, Step 3: For each building id, calculate the new supply of sulfur if the building level is increased by 5, Step 4: For each building id, calculate the new current_input of all Demands connected to sulfur, Step 5: For each building id, calculate the new demand of sulfur, Step 6: For each building id, calculate the new current_price of sulfur, Step 7: Compare the new current_prices and find the building id that leads to the lowest current_price].
Current step: Step 6
Thought: I need to calculate the new current_price of sulfur if the level of building 319 is increased by 5. I need to correct the syntax error in the previous query.
Action: Graph DB
Action input: MATCH (g:Goods {name: 'sulfur'}) RETURN g.base_price*(1+0.75*(150-20.304418)/CASE WHEN 150 > 20.304418 THEN 150 ELSE 20.304418 END) 


Observation:
           0
0  82.423896
Current step: Step 7
Thought: Now I need to compare the new current_prices and find the building id that leads to the lowest current_price. Since there is only one building id in this case, the building id 319 leads to the lowest current_price.
Action: Self thinking
Action input: {'tool_input': {'type': 'string'}}


Observation:
No observation is needed as the thought process does not require any additional data.
Re-plan: N
Thought: I now know the answer.
Final answer: The building id that should be increased by 5 levels to maximally decrease the market price of sulfur is 319.
"""
        else:
            assert(0)

    elif technique == "IterRAG":
        if database_type == "relational":
            prompt = """
Thought: To answer this question, we need to find the building that, if its level is increased by 5, will have the greatest impact on reducing the market price of sulfur. This means we need to find the building that has the greatest impact on the supply of sulfur. We need to find the building that produces sulfur and calculate the potential increase in supply if its level is increased by 5. Then we can calculate the potential decrease in the market price of sulfur. 

Action: Relational DB
Action input: 
SELECT goods_name, code FROM goods WHERE goods_name = 'sulfur';
Observation:
  goods_name  code
0     sulfur    22
Thought: Now that we have the code for sulfur, we can use it to find the buildings that produce sulfur. We need to find the building that, if its level is increased by 5, will have the greatest impact on the supply of sulfur. 

Action: Relational DB
Action input: 
SELECT building_id, max_supply, current_output, level FROM supply WHERE goods_id = 22;

Observation:
   building_id  max_supply  current_output  level
0          319        40.0             1.0      3
Thought: Now that we have the building that produces sulfur, we need to calculate the potential increase in supply if its level is increased by 5. The level and max_supply have a proportional relationship, so if the level is increased by 5, the max_supply will also increase proportionally. 

Action: Self thinking
Action input: 
{'type': 'string', 'content': 'Calculate the potential increase in supply if the level of building 319 is increased by 5.'}

Observation:
The potential increase in supply is 66.67 units.
Thought: Now that we have the potential increase in supply, we can calculate the potential decrease in the market price of sulfur. The current_price of Goods is determined by base_price*(1+0.75(demand-supply)/max(demand,supply)). We need to find the current demand and supply of sulfur, and then calculate the potential decrease in price.

Action: Relational DB
Action input: 
SELECT pop_demand FROM goods WHERE code = 22;

Observation:
   pop_demand
0         0.0
Thought: The pop_demand for sulfur is 0.0. However, the total demand for sulfur also includes the sum of the max_demand of all Demands connected to sulfur. We need to find this value next.

Action: Relational DB
Action input: 
SELECT SUM(max_demand) FROM demand WHERE goods_id = 22;


Observation:
   SUM(max_demand)
0            150.0
Thought: The total demand for sulfur is 150.0. Now we need to find the current supply of sulfur, which is defined by the sum of "current_output" of all Supplies connected to sulfur.

Action: Relational DB
Action input: 
SELECT SUM(current_output) FROM supply WHERE goods_id = 22;


Observation:
   SUM(current_output)
0                  1.0
Thought: The current supply for sulfur is 1.0. Now we have all the necessary data to calculate the potential decrease in the market price of sulfur. The current_price of Goods is determined by base_price*(1+0.75(demand-supply)/max(demand,supply)). We need to calculate the new price if the supply is increased by the potential increase we calculated earlier.

Action: Self thinking
Action input: 
{'type': 'string', 'content': 'Calculate the potential decrease in the market price of sulfur if the supply is increased by 66.67 units.'}


Observation:
The potential decrease in the market price of sulfur is 0.75 units.
Thought: Now that we have calculated the potential decrease in the market price of sulfur if the supply is increased by 66.67 units, we can conclude that increasing the level of building 319 by 5 will maximally decrease the market price of sulfur.
Final answer: The building id that should be increased a level by 5 to maximally decrease the market price of sulfur is 319.
"""

        elif database_type == "graph":
            prompt = """
Thought: To answer this question, we need to find out which building's level increase will lead to the maximum decrease in the market price of sulfur. This means we need to find out how the level increase of each building affects the supply and demand of sulfur, and thus its market price. We can start by finding out all the buildings that are connected to sulfur through the Supply and Demand relationships.
Action: Graph DB
Action input: MATCH (g:Goods {name: 'sulfur'})-[r:Demand]->(b:Building) RETURN b.id, r.max_demand, r.current_input, r.level

Observation:
     0     1         2  3
0  274  40.0  0.866599  4
1  247  60.0  1.299899  6
2  213  50.0  1.083249  5
Thought: Now that we have the buildings that are connected to sulfur through the Demand relationship, we need to find out the buildings that are connected to sulfur through the Supply relationship. This will give us a complete picture of how the level increase of each building affects the supply and demand of sulfur.
Action: Graph DB
Action input: MATCH (g:Goods {name: 'sulfur'})<-[r:Supply]-(b:Building) RETURN b.id, r.max_supply, r.current_output, r.level


Observation:
     0     1        2  3
0  319  40.0  3.38407  1
Thought: Now that we have the buildings that are connected to sulfur through both the Demand and Supply relationships, we need to calculate how the level increase of each building affects the supply and demand of sulfur, and thus its market price. We need to simulate the increase in level by 5 for each building and calculate the new market price of sulfur. The building that results in the maximum decrease in the market price of sulfur is the one we are looking for.
Action: Self thinking
Action input: {'tool_input': {'type': 'string'}}


Observation:
The simulation results are as follows:

Building ID: 274, New Market Price: 1.23
Building ID: 247, New Market Price: 1.20
Building ID: 213, New Market Price: 1.22
Building ID: 319, New Market Price: 1.18

Thought: Now that we have simulated the increase in level by 5 for each building and calculated the new market price of sulfur, we can see that the building with ID 319 results in the maximum decrease in the market price of sulfur.
Final answer: The building id we should increase a level by 5 to maximally decrease the market price of sulfur is 319.
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