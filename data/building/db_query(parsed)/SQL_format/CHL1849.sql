
  
CREATE TABLE goods(    goods_name    VARCHAR(30),    code    INT,    base_price FLOAT,    current_price FLOAT,    pop_demand FLOAT, PRIMARY KEY (code));

CREATE TABLE building(    id INT,    name VARCHAR(80),    level INT, PRIMARY KEY (id));

CREATE TABLE supply(    goods_id INT,    building_id INT,    max_supply FLOAT,    current_output FLOAT,    level INT, PRIMARY KEY (goods_id, building_id));

CREATE TABLE demand(    goods_id INT,    building_id INT,    max_demand FLOAT,    current_input FLOAT,    level INT,   PRIMARY KEY (goods_id, building_id));
    
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("ammunition", 0, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("small_arms", 1, 60, 105.0, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("artillery", 2, 70, 122.5, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tanks", 3, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("aeroplanes", 4, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("manowars", 5, 70, 122.5, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("ironclads", 6, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("grain", 7, 20, 23.91057520559436, 277.72326852820026);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fish", 8, 20, 23.168658162301234, 58.636628838621796);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fabric", 9, 20, 13.622739380281581, 17.3668469527242);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("wood", 10, 20, 14.695795067983234, 45.05227054727576);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("groceries", 11, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("clothes", 12, 30, 49.51590285038179, 57.7246454667331);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("furniture", 13, 30, 49.214739669726065, 52.43296807033755);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("paper", 14, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("services", 15, 30, 21.191598046823373, 35.08445833333334);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("transportation", 16, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("electricity", 17, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("clippers", 18, 60, 60, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("steamers", 19, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("silk", 20, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("dye", 21, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("sulfur", 22, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("coal", 23, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("iron", 24, 40, 40.0, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("lead", 25, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("hardwood", 26, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("rubber", 27, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("oil", 28, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("engines", 29, 60, 60, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("steel", 30, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("glass", 31, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fertilizer", 32, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tools", 33, 40, 29.989946078431373, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("explosives", 34, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("porcelain", 35, 70, 122.5, 2.2805375);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("meat", 36, 30, 22.82596048491518, 7.655637404500818);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fruit", 37, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("liquor", 38, 30, 33.8015294575908, 12.897224639471935);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("wine", 39, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tea", 40, 50, 87.5, 12.617609999999999);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("coffee", 41, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("sugar", 42, 30, 8.789413087932834, 5.11057330106473);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tobacco", 43, 40, 34.494839458173836, 70.88982902039608);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("opium", 44, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("automobiles", 45, 100, 100, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("telephones", 46, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("radios", 47, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("luxury_clothes", 48, 60, 105.0, 10.642508333333334);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("luxury_furniture", 49, 60, 105.0, 2.6606270833333334);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("gold", 50, 100, 25.0, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fine_art", 51, 200, 200, 0);
INSERT INTO building(id, name, level) VALUES (1823, "building_government_administrationlevel", 3);
INSERT INTO building(id, name, level) VALUES (1824, "building_tooling_workshopslevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 1824, 30.0, 46.411872037803064, 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (24, 1824, 20.0, 20.0, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (33, 1824, 60.0, 60.0, 1);
INSERT INTO building(id, name, level) VALUES (1825, "building_gold_minelevel", 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 1825, 14.979892156862745, 22.481139415917166, 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (50, 1825, 29.95979411764706, 29.95979411764706, 3);
INSERT INTO building(id, name, level) VALUES (1826, "building_iron_minelevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 1826, 5.0, 7.503772116816566, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (24, 1826, 20.0, 20.0, 1);
INSERT INTO building(id, name, level) VALUES (1827, "building_wheat_farmlevel", 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 1827, 89.99999999999999, 100.8, 3);
INSERT INTO building(id, name, level) VALUES (1828, "building_livestock_ranchlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 1828, 29.999999999999996, 33.0, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (36, 1828, 5.0, 5.5, 1);
INSERT INTO building(id, name, level) VALUES (1829, "building_portlevel", 2);
INSERT INTO building(id, name, level) VALUES (1830, "building_naval_baselevel", 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (5, 1830, 6.0, 0.0, 3);
INSERT INTO building(id, name, level) VALUES (1831, "building_barrackslevel", 5);
INSERT INTO building(id, name, level) VALUES (1832, "building_livestock_ranchlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 1832, 29.999999999999996, 33.0, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (36, 1832, 5.0, 5.5, 1);
INSERT INTO building(id, name, level) VALUES (1833, "building_tobacco_plantationlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 1833, 22.10775, 22.10775, 1);
INSERT INTO building(id, name, level) VALUES (1834, "building_logging_camplevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 1834, 9.999999999999998, 15.00754423363313, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 1834, 119.99999999999999, 119.99999999999999, 2);
INSERT INTO building(id, name, level) VALUES (1835, "building_barrackslevel", 5);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (1, 1835, 5.0, 0.0, 5);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (2, 1835, 2.5, 0.0, 5);
INSERT INTO building(id, name, level) VALUES (3107, "building_subsistence_farmslevel", 14);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3107, 2.4097454545454546, 2.65072, 14);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3107, 0.48194545454545445, 0.53014, 14);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3107, 0.48194545454545445, 0.53014, 14);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3107, 0.48194545454545445, 0.53014, 14);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3107, 0.48194545454545445, 0.53014, 14);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3107, 0.48194545454545445, 0.53014, 14);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3107, 0.6747272727272726, 0.7422, 14);
INSERT INTO building(id, name, level) VALUES (3124, "building_subsistence_farmslevel", 80);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3124, 29.271999999999995, 32.1992, 80);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3124, 5.8544, 6.43984, 80);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3124, 5.8544, 6.43984, 80);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3124, 5.8544, 6.43984, 80);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3124, 5.8544, 6.43984, 80);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3124, 5.8544, 6.43984, 80);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3124, 8.196154545454545, 9.01577, 80);
INSERT INTO building(id, name, level) VALUES (3125, "building_urban_centerlevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 3125, 10.0, 15.470624012601023, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3125, 50.0, 50.0, 2);
INSERT INTO building(id, name, level) VALUES (3126, "building_subsistence_farmslevel", 30);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3126, 1.2555, 1.38105, 30);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3126, 0.2511, 0.27621, 30);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3126, 0.2511, 0.27621, 30);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3126, 0.2511, 0.27621, 30);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3126, 0.2511, 0.27621, 30);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3126, 0.2511, 0.27621, 30);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3126, 0.3515363636363636, 0.38669, 30);
INSERT INTO building(id, name, level) VALUES (3127, "building_subsistence_farmslevel", 16);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3127, 1.4531999999999998, 1.59852, 16);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3127, 0.2906363636363636, 0.3197, 16);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3127, 0.2906363636363636, 0.3197, 16);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3127, 0.2906363636363636, 0.3197, 16);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3127, 0.2906363636363636, 0.3197, 16);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3127, 0.2906363636363636, 0.3197, 16);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3127, 0.406890909090909, 0.44758, 16);
INSERT INTO building(id, name, level) VALUES (3893, "building_trade_centerlevel", 10);
INSERT INTO building(id, name, level) VALUES (33558518, "building_construction_sectorlevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (9, 33558518, 25.0, 43.48965954572944, 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 33558518, 75.0, 116.02968009450767, 1);
INSERT INTO building(id, name, level) VALUES (33558523, "building_tobacco_plantationlevel", 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 33558523, 63.4455, 64.71441, 3);
INSERT INTO building(id, name, level) VALUES (4095, "building_conscription_centerlevel", 2);
INSERT INTO building(id, name, level) VALUES (4760, "building_sugar_plantationlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (42, 4760, 29.5293, 29.5293, 1);
INSERT INTO building(id, name, level) VALUES (100668791, "building_wheat_farmlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 100668791, 59.99999999999999, 66.6, 2);
INSERT INTO building(id, name, level) VALUES (151000563, "building_sugar_plantationlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (42, 151000563, 59.05859405940594, 59.64918, 2);
INSERT INTO building(id, name, level) VALUES (16783049, "building_fishing_wharflevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (8, 16783049, 25.0, 25.0, 1);
INSERT INTO building(id, name, level) VALUES (100669359, "building_fishing_wharflevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (8, 100669359, 21.25, 21.25, 1);
INSERT INTO building(id, name, level) VALUES (16783420, "building_logging_camplevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 16783420, 9.999999999999998, 15.00754423363313, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 16783420, 119.99999999999999, 119.99999999999999, 2);
INSERT INTO building(id, name, level) VALUES (6268, "building_gold_fieldslevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (50, 6268, 40.0, 40.4, 2);
INSERT INTO building(id, name, level) VALUES (6574, "building_subsistence_pastureslevel", 16);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 6574, 0.08175454545454544, 0.08993, 16);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 6574, 0.12263636363636361, 0.1349, 16);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 6574, 0.04087272727272727, 0.04496, 16);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 6574, 0.08175454545454544, 0.08993, 16);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 6574, 0.08175454545454544, 0.08993, 16);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 6574, 0.08175454545454544, 0.08993, 16);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (36, 6574, 0.21747272727272723, 0.23922, 16);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 6574, 0.11446363636363635, 0.12591, 16);
INSERT INTO building(id, name, level) VALUES (6575, "building_subsistence_pastureslevel", 14);
