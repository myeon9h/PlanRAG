
  
CREATE TABLE goods(    goods_name    VARCHAR(30),    code    INT,    base_price FLOAT,    current_price FLOAT,    pop_demand FLOAT, PRIMARY KEY (code));

CREATE TABLE building(    id INT,    name VARCHAR(80),    level INT, PRIMARY KEY (id));

CREATE TABLE supply(    goods_id INT,    building_id INT,    max_supply FLOAT,    current_output FLOAT,    level INT, PRIMARY KEY (goods_id, building_id));

CREATE TABLE demand(    goods_id INT,    building_id INT,    max_demand FLOAT,    current_input FLOAT,    level INT,   PRIMARY KEY (goods_id, building_id));
    
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("ammunition", 0, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("small_arms", 1, 60, 105.0, 0.004663957134013045);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("artillery", 2, 70, 122.5, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tanks", 3, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("aeroplanes", 4, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("manowars", 5, 70, 122.5, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("ironclads", 6, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("grain", 7, 20, 24.74768512074235, 79.79663551034487);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fish", 8, 20, 16.561051076770088, 105.8375689241379);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fabric", 9, 20, 8.055017406858687, 7.338654990109957);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("wood", 10, 20, 17.619960093437186, 33.02747000989005);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("groceries", 11, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("clothes", 12, 30, 41.88624572503252, 34.448458625270035);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("furniture", 13, 30, 41.731073902929616, 33.95208321649329);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("paper", 14, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("services", 15, 30, 22.277928360974073, 20.524972749002647);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("transportation", 16, 30, 29.037712499999998, 4.786158333333333);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("electricity", 17, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("clippers", 18, 60, 52.93390186605483, 0.03653993367293204);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("steamers", 19, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("silk", 20, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("dye", 21, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("sulfur", 22, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("coal", 23, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("iron", 24, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("lead", 25, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("hardwood", 26, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("rubber", 27, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("oil", 28, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("engines", 29, 60, 60, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("steel", 30, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("glass", 31, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fertilizer", 32, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tools", 33, 40, 70.0, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("explosives", 34, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("porcelain", 35, 70, 122.5, 1.9191591836734696);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("meat", 36, 30, 43.63519462654149, 14.20800805351168);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fruit", 37, 30, 25.07520874423484, 2.9394341344635615);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("liquor", 38, 30, 33.9184993040167, 19.67696156419898);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("wine", 39, 50, 23.859369815046993, 7.269996681630074);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tea", 40, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("coffee", 41, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("sugar", 42, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tobacco", 43, 40, 42.94377180895212, 33.264060076850775);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("opium", 44, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("automobiles", 45, 100, 100, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("telephones", 46, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("radios", 47, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("luxury_clothes", 48, 60, 105.0, 11.19509523809524);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("luxury_furniture", 49, 60, 105.0, 2.239019047619048);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("gold", 50, 100, 100, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fine_art", 51, 200, 200, 0);
INSERT INTO building(id, name, level) VALUES (832, "building_fishing_wharf", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 832, 4.247, 5.038105509810984, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (8, 832, 42.47, 42.47, 1);
INSERT INTO building(id, name, level) VALUES (834, "building_government_administration", 2);
INSERT INTO building(id, name, level) VALUES (835, "building_shipyards", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (9, 835, 16.112, 79.10920555065081, 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 835, 32.224, 38.30123046517111, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (18, 835, 28.195999999999998, 28.195999999999998, 1);
INSERT INTO building(id, name, level) VALUES (836, "building_wheat_farm", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 836, 1.0, 0.0, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 836, 20.0, 0.0, 1);
INSERT INTO building(id, name, level) VALUES (837, "building_vineyard_plantation", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (39, 837, 20.0, 24.0, 1);
INSERT INTO building(id, name, level) VALUES (838, "building_fishing_wharf", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 838, 5.0, 5.931369801990798, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (8, 838, 50.0, 50.0, 1);
INSERT INTO building(id, name, level) VALUES (839, "building_tobacco_plantation", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 839, 25.0, 30.0, 1);
INSERT INTO building(id, name, level) VALUES (840, "building_logging_camp", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 840, 60.0, 60.6, 2);
INSERT INTO building(id, name, level) VALUES (841, "building_cotton_plantation", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 841, 80.0, 96.8, 2);
INSERT INTO building(id, name, level) VALUES (842, "building_port", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 842, 5.0, 5.931369801990798, 1);
INSERT INTO building(id, name, level) VALUES (866, "building_wheat_farm", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 866, 0.9162166666666668, 0.0, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 866, 18.3244, 0.0, 1);
INSERT INTO building(id, name, level) VALUES (867, "building_fishing_wharf", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 867, 4.485, 5.320438712385746, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (8, 867, 44.85, 44.85, 1);
INSERT INTO building(id, name, level) VALUES (868, "building_port", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 868, 5.0, 5.931369801990798, 1);
INSERT INTO building(id, name, level) VALUES (2844, "building_subsistence_farms", 9);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2844, 15.121433333333334, 18.14572, 9);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 2844, 3.7803583333333335, 4.53643, 9);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 2844, 3.7803583333333335, 4.53643, 9);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 2844, 3.7803583333333335, 4.53643, 9);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 2844, 3.7803583333333335, 4.53643, 9);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 2844, 3.7803583333333335, 4.53643, 9);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 2844, 3.7803583333333335, 4.53643, 9);
INSERT INTO building(id, name, level) VALUES (3287, "building_subsistence_farms", 19);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3287, 34.32995833333334, 41.19595, 19);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3287, 8.582483333333334, 10.29898, 19);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3287, 8.582483333333334, 10.29898, 19);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3287, 8.582483333333334, 10.29898, 19);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3287, 8.582483333333334, 10.29898, 19);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3287, 8.582483333333334, 10.29898, 19);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3287, 8.582483333333334, 10.29898, 19);
INSERT INTO building(id, name, level) VALUES (3288, "building_urban_center", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3288, 15.0, 15.0, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (16, 3288, 5.0, 5.0, 1);
INSERT INTO building(id, name, level) VALUES (3474, "building_subsistence_orchards", 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3474, 1.4147, 1.4147, 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3474, 0.70735, 0.70735, 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3474, 2.12205, 2.12205, 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3474, 1.4147, 1.4147, 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3474, 1.4147, 1.4147, 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3474, 1.4147, 1.4147, 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (37, 3474, 3.7631, 3.7631, 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3474, 1.4147, 1.4147, 4);
INSERT INTO building(id, name, level) VALUES (3937, "building_barracks", 8);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (1, 3937, 8.0, 0.0, 8);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (2, 3937, 2.0, 0.0, 8);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (7, 3937, 3.0, 2.05046297585153, 8);
INSERT INTO building(id, name, level) VALUES (3938, "building_barracks", 5);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (1, 3938, 6.0, 0.0, 5);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (7, 3938, 2.0, 1.366975317234353, 5);
INSERT INTO building(id, name, level) VALUES (3939, "building_naval_base", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (5, 3939, 1.0, 0.0, 1);
INSERT INTO building(id, name, level) VALUES (4156, "building_trade_center", 4);
INSERT INTO building(id, name, level) VALUES (4203, "building_trade_center", 11);
INSERT INTO building(id, name, level) VALUES (4342, "building_conscription_center", 2);
INSERT INTO building(id, name, level) VALUES (4627, "building_livestock_ranch", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (7, 4627, 0.35195, 0.24055348145031527, 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 4627, 0.35195, 0.0, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 4627, 0.7039, 0.24055348145031527, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (36, 4627, 1.4078, 0.48110696290063054, 1);
INSERT INTO building(id, name, level) VALUES (4806, "building_barracks", 1);
INSERT INTO building(id, name, level) VALUES (4846, "building_livestock_ranch", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (7, 4846, 3.7431, 2.5583626549699536, 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 4846, 3.7431, 0.0, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 4846, 7.4862, 2.5583626549699536, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (36, 4846, 14.9724, 5.116725309939907, 1);
INSERT INTO building(id, name, level) VALUES (4847, "building_naval_base", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (5, 4847, 0.327, 0.0, 1);
