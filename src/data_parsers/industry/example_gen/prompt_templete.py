def question(goods):
    situation_query = f"""Goods have a "name", corresponding "code", "base_price", "current_price", and "pop_demand".
Buildings have a unique "id" and a "name" and "level" corresponding to their type.
There exists a relation called Supply from Buildings to Goods. Supply has "max_supply", "current_output", and "level". The level here is the same as the level of the Building. Furthermore, max_supply and level have a proportional relationship.
There exists a relation called Demand from Goods to Buildings. Demand has "max_demand", "current_input", and "level". Also, max_demand and level have a proportional relationship.
The demand of Goods is defined as the Goods' "pop_demand" plus sum of the "max_demand" of all Demands connected to the Goods.
The supply of Goods is defined by the sum of "current_output" of all Supplies connected to Goods.
The "current_input" of Demand is determined by the ratio of connected Building's "max_demand" to connected Goods' demand, and multiplied by the supply of Goods.
The "current_output" of Supply is determined by the average ratio of the connected Building's "current_input" to connected Goods' "max_demand", and multiplied by the "max_supply" of Supply.
The "current_price" of Goods is determined by base_price*(1+0.75(demand-supply)/max(demand,supply)).
Which building id should we increase a level for decreasing the market price of {goods}?"""

    return situation_query
