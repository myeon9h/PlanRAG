from tradenode import Node

def cql_gen(nodes_dict, dir_path, anony=False):
    # Graph structure and flow
    
    file = open(dir_path+"cypher.cql", "w")    
    
    query = ""
    
    # Graph node generation
    for node in nodes_dict.values():
        if anony:
            query = query + "CREATE ({0}:Trade_node {{name:\"{0}\"}})\n".format(node.anony_name)
        else:
            query = query + "CREATE ({0}:Trade_node {{name:\"{0}\"}})\n".format(node.name)
    
    query = query + ";\n"
    
    
    # node relationship generation
    for node in nodes_dict.values():
        for downstream in node.out_going:
            if anony:
                # query = query + "MATCH ({0}:Trade_node {{name:\"{0}\"}}), ({1}:Trade_node {{name:\"{1}\"}}) CREATE ({0})-[r:DOWNSTREAM]->({1});\n".format(node.anony_name, nodes_dict[downstream].anony_name)

                query = query + "MATCH ({0}:Trade_node {{name:\"{0}\"}}), ({1}:Trade_node {{name:\"{1}\"}}) CREATE ({0})-[r:UPSTREAM]->({1});\n".format(node.anony_name, nodes_dict[downstream].anony_name)
            else:
                # query = query + "MATCH ({0}:Trade_node {{name:\"{0}\"}}), ({1}:Trade_node {{name:\"{1}\"}}) CREATE ({0})-[r:DOWNSTREAM]->({1});\n".format(node.name, downstream)
                
                query = query + "MATCH ({0}:Trade_node {{name:\"{0}\"}}), ({1}:Trade_node {{name:\"{1}\"}}) CREATE ({0})-[r:UPSTREAM]->({1});\n".format(node.name, downstream)

    
    file.write(query)
    
    file.close
    
    return
    

def sql_gen(nodes_dict, dir_path, anony=False, norm = False):
    general_node_value_keys = ['name', 'current', 'local_value', 'outgoing', 
                               'value_added_outgoing', 'retention', 'total'
                            #    , 'steer_power','num_collectors', 'num_collectors_including_pirates', 
                            # 'p_pow', 'max', 'collector_power', 'collector_power_including_pirates', 'pull_power', 'retain_power',
                            #    'highest_power', 'total_privateer_power', 'add', 'value', 'from', 'trade_company_region', 'most_recent_treasure_ship_passage'
                               ]
    
    specific_node_keys = ['country_code', 'val'
                        #   ,'type', 'prev', 'steer_power', 'add', "max_pow", "max_demand", "profince_power",
                        #   "power_fraction", "money", "total", "already_sent", "ship_power", "has_trader", "has_capital", "light_ship", "potential", "t_out"
                          ]
    
    forbidden_keys = ["add", "value", "from", "money", "retention", "type"]
    
    file = open(dir_path+"mysql.sql", "w")    
    query = ""
    
    # General node name and statistics 
    for node in nodes_dict.values():
        query = query + """CREATE TABLE general
        (
        """
        
        query = query + "   name    VARCHAR(30),\n"
        
        for key in general_node_value_keys:            
            if key in ["trade_company_region","most_recent_treasure_ship_passage"]:
                query = query + "    {} VARCHAR(10),\n".format(key)
            elif (key in ["name"]):
                continue
            elif (key in forbidden_keys):
                query = query + "    {}_ FLOAT,\n".format(key)
            else:
                query = query + "    {} FLOAT,\n".format(key)
        

        query = query + """   CONSTRAINT name PRIMARY KEY (name)
        )"""
        
        break
    
    query = query + ";\n"
    
    for node in nodes_dict.values():
        
        structure = "name"
        if anony:
            values = "\'{}\'".format(node.anony_name)
        else:
            values = "\'{}\'".format(node.name)
        
        for key in node.node_values.keys():
            if key not in general_node_value_keys:
                continue
            
            if (key in ['trade_company_region', 'most_recent_treasure_ship_passage']):
                
                structure = structure + ",{}".format(key)
                values = values + ",\'{}\'".format(node.node_values[key])
            elif (key in forbidden_keys):
                structure = structure + ",{}_".format(key)
                values = values + ",{}".format(node.node_values[key])
            else:
                structure = structure + ",{}".format(key)
                values = values + ",{}".format(node.node_values[key])
            
            
            node.node_values[key]
        
        query = query + "INSERT INTO general({})".format(structure)
        query = query + " VALUES({});\n".format(values)
    
    
    # Node table countries
    
    if norm:
    
        for node in nodes_dict.values():
            if anony:
                name = node.anony_name
            else:
                name = node.name
            query = query + """CREATE TABLE {}
            (
                country_code    VARCHAR(5),
                val FLOAT,
                CONSTRAINT country_code PRIMARY KEY (country_code)
            );
            """.format(name)
                # type_ INT,
                # prev FLOAT,
                # steer_power FLOAT,
                # add_ FLOAT,
                # max_pow FLOAT,
                # max_demand FLOAT,
                # province_power FLOAT,
                # power_fraction FLOAT,
                # money_ FLOAT,
                # total FLOAT,
                # already_sent FLOAT,
                # ship_power FLOAT,
                # has_trader BOOLEAN,
                # has_capital BOOLEAN,
                # light_ship INT,
                # potential FLOAT,
                # t_out FLOAT,
    else:
        query = query + """CREATE TABLE trading
            (
                node_name VARCHAR(30),
                country_code    VARCHAR(5),
                val FLOAT,
                CONSTRAINT country_code PRIMARY KEY (node_name, country_code)
            );
            """
                # type_ INT,
                # prev FLOAT,
                # steer_power FLOAT,
                # add_ FLOAT,
                # max_pow FLOAT,
                # max_demand FLOAT,
                # province_power FLOAT,
                # power_fraction FLOAT,
                # money_ FLOAT,
                # total FLOAT,
                # already_sent FLOAT,
                # ship_power FLOAT,
                # has_trader BOOLEAN,
                # has_capital BOOLEAN,
                # light_ship INT,
                # potential FLOAT,
                # t_out FLOAT,
    
        
    for node in nodes_dict.values():
        for country_code in node.node_countries.keys():
            if anony:
                name = node.anony_name
            else:
                name = node.name
            
            country_dict = node.node_countries[country_code]
            if norm:
                structure = "country_code"
                values = "\'{}\'".format(country_code)
            else:
                structure = "node_name, country_code"
                values = "\'{}\',\'{}\'".format(name, country_code)
            
            
            
            for country_dict_key in country_dict.keys():
                if country_dict_key not in specific_node_keys:
                    continue
            
                if country_dict_key in ['has_trader','has_capital']:
                    if (country_dict[country_dict_key] == "yes"):
                        structure = structure + ",{}".format(country_dict_key)
                        values = values + ",True"
                    else:
                        structure = structure + ",{}".format(country_dict_key)
                        values = values + ",False"
                # FLOAT 일 경우
                elif (country_dict_key in forbidden_keys):
                    structure = structure + ",{}_".format(country_dict_key)
                    values = values + ",{}".format(country_dict[country_dict_key])
                else:
                    structure = structure + ",{}".format(country_dict_key)
                    values = values + ",{}".format(country_dict[country_dict_key])
            
        
            if norm:
                query = query + "INSERT INTO {}({})".format(name,structure)
            else:
                query = query + "INSERT INTO trading({})".format(structure)
            query = query + " VALUES({});\n".format(values)
    
    
    
    file.write(query)
    
    file.close
    
    
    
    return


# 

"""

DROP DATABASE eu4;
create database eu4;
use eu4;

"""
    
    