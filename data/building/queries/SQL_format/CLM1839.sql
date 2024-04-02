
  
CREATE TABLE goods(    goods_name    VARCHAR(30),    code    INT,    base_price FLOAT,    current_price FLOAT,    pop_demand FLOAT, PRIMARY KEY (code));

CREATE TABLE building(    id INT,    name VARCHAR(80),    level INT, PRIMARY KEY (id));

CREATE TABLE supply(    goods_id INT,    building_id INT,    max_supply FLOAT,    current_output FLOAT,    level INT, PRIMARY KEY (goods_id, building_id));

CREATE TABLE demand(    goods_id INT,    building_id INT,    max_demand FLOAT,    current_input FLOAT,    level INT,   PRIMARY KEY (goods_id, building_id));
    
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("ammunition", 0, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("small_arms", 1, 60, 105.0, 0.22863859327780844);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("artillery", 2, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tanks", 3, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("aeroplanes", 4, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("manowars", 5, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("ironclads", 6, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("grain", 7, 20, 20.35116123382266, 321.5589434703178);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fish", 8, 20, 19.81208473961274, 24.68680789935457);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fabric", 9, 20, 10.910610721757994, 11.116180000000004);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("wood", 10, 20, 20.809382612342553, 66.69707999999999);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("groceries", 11, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("clothes", 12, 30, 30.254393779622234, 78.85242630039743);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("furniture", 13, 30, 27.48832974923562, 68.17958520180821);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("paper", 14, 30, 20.70986419641831, 0.22217022643471077);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("services", 15, 30, 27.111712898881375, 54.4289446525435);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("transportation", 16, 30, 30.49920405929759, 10.051000000000002);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("electricity", 17, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("clippers", 18, 60, 105.0, 0.11857241378376834);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("steamers", 19, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("silk", 20, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("dye", 21, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("sulfur", 22, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("coal", 23, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("iron", 24, 40, 70.0, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("lead", 25, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("hardwood", 26, 40, 70.0, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("rubber", 27, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("oil", 28, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("engines", 29, 60, 60, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("steel", 30, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("glass", 31, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fertilizer", 32, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tools", 33, 40, 70.0, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("explosives", 34, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("porcelain", 35, 70, 122.5, 3.9706602040816317);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("meat", 36, 30, 26.530509136361594, 7.361060502682899);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fruit", 37, 30, 30.58374355480952, 36.958866676236326);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("liquor", 38, 30, 24.25627648042906, 24.546746039155973);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("wine", 39, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tea", 40, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("coffee", 41, 50, 23.490269430085046, 20.10149);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("sugar", 42, 30, 9.928165924954458, 4.833798470125335);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tobacco", 43, 40, 29.843514682801594, 80.03550922063309);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("opium", 44, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("automobiles", 45, 100, 100, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("telephones", 46, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("radios", 47, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("luxury_clothes", 48, 60, 105.0, 4.632436904761906);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("luxury_furniture", 49, 60, 105.0, 23.162184523809522);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("gold", 50, 100, 100, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fine_art", 51, 200, 200, 0);
INSERT INTO building(id, name, level) VALUES (1592, "building_coffee_plantation", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (41, 1592, 18.308, 21.9696, 1);
INSERT INTO building(id, name, level) VALUES (1593, "building_banana_plantation", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (37, 1593, 30.0, 36.0, 1);
INSERT INTO building(id, name, level) VALUES (1656, "building_government_administration", 1);
INSERT INTO building(id, name, level) VALUES (1657, "building_fishing_wharf", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (8, 1657, 25.0, 25.0, 1);
INSERT INTO building(id, name, level) VALUES (1658, "building_tobacco_plantation", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 1658, 50.0, 60.5, 2);
INSERT INTO building(id, name, level) VALUES (1659, "building_sugar_plantation", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (42, 1659, 29.676, 35.6112, 1);
INSERT INTO building(id, name, level) VALUES (1660, "building_port", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 1660, 5.0, 0.0, 1);
INSERT INTO building(id, name, level) VALUES (1662, "building_rice_farm", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 1662, 40.0, 48.0, 1);
INSERT INTO building(id, name, level) VALUES (1663, "building_livestock_ranch", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (7, 1663, 4.45585, 4.351535214418087, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 1663, 8.9117, 8.703070428836174, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (36, 1663, 8.9117, 8.703070428836174, 1);
INSERT INTO building(id, name, level) VALUES (1664, "building_logging_camp", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 1664, 4.64345, 0.0, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 1664, 55.7214, 0.0, 1);
INSERT INTO building(id, name, level) VALUES (1665, "building_government_administration", 2);
INSERT INTO building(id, name, level) VALUES (1666, "building_textile_mills", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (9, 1666, 40.0, 101.51235265609608, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 1666, 45.0, 45.0, 1);
INSERT INTO building(id, name, level) VALUES (1667, "building_sugar_plantation", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (42, 1667, 7.65, 9.18, 1);
INSERT INTO building(id, name, level) VALUES (1668, "building_cotton_plantation", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 1668, 78.92800000000001, 115.23488, 2);
INSERT INTO building(id, name, level) VALUES (1669, "building_rice_farm", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 1669, 75.536, 91.39856, 2);
INSERT INTO building(id, name, level) VALUES (1670, "building_furniture_manufacturies", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (9, 1670, 10.0, 25.37808816402402, 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 1670, 30.0, 28.381234775314894, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 1670, 45.0, 43.78592608148617, 1);
INSERT INTO building(id, name, level) VALUES (1671, "building_logging_camp", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 1671, 60.0, 60.6, 2);
INSERT INTO building(id, name, level) VALUES (1672, "building_tobacco_plantation", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 1672, 50.0, 60.5, 2);
INSERT INTO building(id, name, level) VALUES (1673, "building_coffee_plantation", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (41, 1673, 38.528, 46.61888, 2);
INSERT INTO building(id, name, level) VALUES (1674, "building_maize_farm", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 1674, 39.216, 47.45136, 2);
INSERT INTO building(id, name, level) VALUES (2826, "building_subsistence_farms", 18);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2826, 9.268558333333335, 11.12227, 18);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 2826, 2.3171333333333335, 2.78056, 18);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 2826, 2.3171333333333335, 2.78056, 18);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 2826, 2.3171333333333335, 2.78056, 18);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 2826, 2.3171333333333335, 2.78056, 18);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 2826, 2.3171333333333335, 2.78056, 18);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 2826, 2.3171333333333335, 2.78056, 18);
INSERT INTO building(id, name, level) VALUES (2961, "building_subsistence_farms", 116);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2961, 53.295033333333336, 63.95404, 116);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 2961, 13.323758333333334, 15.98851, 116);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 2961, 13.323758333333334, 15.98851, 116);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 2961, 13.323758333333334, 15.98851, 116);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 2961, 13.323758333333334, 15.98851, 116);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 2961, 13.323758333333334, 15.98851, 116);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 2961, 13.323758333333334, 15.98851, 116);
INSERT INTO building(id, name, level) VALUES (2962, "building_subsistence_farms", 58);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2962, 5.697916666666667, 6.8375, 58);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 2962, 1.4244750000000002, 1.70937, 58);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 2962, 1.4244750000000002, 1.70937, 58);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 2962, 1.4244750000000002, 1.70937, 58);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 2962, 1.4244750000000002, 1.70937, 58);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 2962, 1.4244750000000002, 1.70937, 58);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 2962, 1.4244750000000002, 1.70937, 58);
INSERT INTO building(id, name, level) VALUES (2963, "building_subsistence_rice_paddies", 45);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2963, 26.964900000000004, 32.35788, 45);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 2963, 4.49415, 5.39298, 45);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 2963, 4.49415, 5.39298, 45);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 2963, 5.9922, 7.19064, 45);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 2963, 5.9922, 7.19064, 45);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 2963, 5.9922, 7.19064, 45);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 2963, 5.9922, 7.19064, 45);
INSERT INTO building(id, name, level) VALUES (2964, "building_urban_center", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 2964, 14.484, 14.484, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (16, 2964, 4.828, 4.828, 1);
INSERT INTO building(id, name, level) VALUES (2965, "building_subsistence_farms", 74);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2965, 16.416158333333335, 19.69939, 74);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 2965, 4.104033333333334, 4.92484, 74);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 2965, 4.104033333333334, 4.92484, 74);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 2965, 4.104033333333334, 4.92484, 74);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 2965, 4.104033333333334, 4.92484, 74);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 2965, 4.104033333333334, 4.92484, 74);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 2965, 4.104033333333334, 4.92484, 74);
INSERT INTO building(id, name, level) VALUES (2976, "building_subsistence_farms", 7);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2976, 1.4679, 1.4679, 7);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 2976, 0.36697, 0.36697, 7);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 2976, 0.36697, 0.36697, 7);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 2976, 0.36697, 0.36697, 7);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 2976, 0.36697, 0.36697, 7);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 2976, 0.36697, 0.36697, 7);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 2976, 0.36697, 0.36697, 7);
INSERT INTO building(id, name, level) VALUES (4033, "building_barracks", 7);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (1, 4033, 6.84593, 0.0, 7);
INSERT INTO building(id, name, level) VALUES (4034, "building_barracks", 5);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (1, 4034, 7.0, 0.0, 5);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (7, 4034, 4.0, 3.906357004313958, 5);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (24, 4034, 4.0, 0.0, 5);
INSERT INTO building(id, name, level) VALUES (4035, "building_barracks", 6);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (1, 4035, 5.99994, 0.0, 6);
INSERT INTO building(id, name, level) VALUES (4171, "building_trade_center", 25);
INSERT INTO building(id, name, level) VALUES (4172, "building_urban_center", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 4172, 15.0, 15.0, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (16, 4172, 5.0, 5.0, 1);
INSERT INTO building(id, name, level) VALUES (4389, "building_conscription_center", 2);
INSERT INTO building(id, name, level) VALUES (4639, "building_conscription_center", 1);
INSERT INTO building(id, name, level) VALUES (4716, "building_artillery_foundries", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (24, 4716, 0.80715, 0.0, 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (26, 4716, 0.5381, 0.0, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (2, 4716, 1.34525, 0.0, 1);
INSERT INTO building(id, name, level) VALUES (4897, "building_paper_mills", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 4897, 0.3, 0.2838123477531489, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (14, 4897, 0.4, 0.37841646367086523, 1);
INSERT INTO building(id, name, level) VALUES (5462, "building_maize_farm", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 5462, 0.96, 0.0, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 5462, 4.8, 0.0, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (37, 5462, 6.720000000000001, 0.0, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (42, 5462, 4.8, 0.0, 1);