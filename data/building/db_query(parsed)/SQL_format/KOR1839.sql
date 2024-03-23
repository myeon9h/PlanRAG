
  
CREATE TABLE goods(    goods_name    VARCHAR(30),    code    INT,    base_price FLOAT,    current_price FLOAT,    pop_demand FLOAT, PRIMARY KEY (code));

CREATE TABLE building(    id INT,    name VARCHAR(80),    level INT, PRIMARY KEY (id));

CREATE TABLE supply(    goods_id INT,    building_id INT,    max_supply FLOAT,    current_output FLOAT,    level INT, PRIMARY KEY (goods_id, building_id));

CREATE TABLE demand(    goods_id INT,    building_id INT,    max_demand FLOAT,    current_input FLOAT,    level INT,   PRIMARY KEY (goods_id, building_id));
    
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("ammunition", 0, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("small_arms", 1, 60, 105.0, 0.1947705031541171);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("artillery", 2, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tanks", 3, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("aeroplanes", 4, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("manowars", 5, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("ironclads", 6, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("grain", 7, 20, 13.206278897109524, 1292.8556006002648);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fish", 8, 20, 12.366850006871159, 18.76287584416705);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fabric", 9, 20, 9.962173689891028, 39.881743490595156);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("wood", 10, 20, 27.227911891098916, 239.2904609435709);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("groceries", 11, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("clothes", 12, 30, 23.34823393021643, 302.9868955045135);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("furniture", 13, 30, 21.020209232341365, 258.47966656197815);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("paper", 14, 30, 52.5, 7.865270351073467);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("services", 15, 30, 15.457195151039285, 162.55737873924477);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("transportation", 16, 30, 49.869991210086496, 71.37424166666665);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("electricity", 17, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("clippers", 18, 60, 34.085656350865285, 0.15790236308011232);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("steamers", 19, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("silk", 20, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("dye", 21, 40, 70.0, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("sulfur", 22, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("coal", 23, 30, 52.5, 0.017016210555987253);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("iron", 24, 40, 70.0, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("lead", 25, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("hardwood", 26, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("rubber", 27, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("oil", 28, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("engines", 29, 60, 60, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("steel", 30, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("glass", 31, 40, 28.555886096805576, 10.039756111106227);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fertilizer", 32, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tools", 33, 40, 70.0, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("explosives", 34, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("porcelain", 35, 70, 101.71758086101762, 91.62367354573546);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("meat", 36, 30, 43.79617298022304, 39.500377783743524);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fruit", 37, 30, 50.01127201601366, 122.37576864956091);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("liquor", 38, 30, 23.795819065602245, 311.54383826808254);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("wine", 39, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tea", 40, 50, 87.5, 110.42879999999998);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("coffee", 41, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("sugar", 42, 30, 40.43649404855818, 37.86958798204088);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tobacco", 43, 40, 11.357259428789273, 10.038618739687394);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("opium", 44, 50, 87.5, 90.97915497583864);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("automobiles", 45, 100, 100, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("telephones", 46, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("radios", 47, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("luxury_clothes", 48, 60, 105.0, 35.65959745126617);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("luxury_furniture", 49, 60, 105.0, 74.1274125787091);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("gold", 50, 100, 100, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fine_art", 51, 200, 200, 0);
INSERT INTO building(id, name, level) VALUES (2513, "building_government_administration", 6);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 2513, 60.0, 6, 0.0);
INSERT INTO building(id, name, level) VALUES (2514, "building_construction_sector", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (9, 2514, 20.0, 1, 60.457375889756136);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2514, 40.0, 1, 20.725568290402887);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (24, 2514, 50.0, 1, 0.0);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 2514, 10.0, 1, 0.0);
INSERT INTO building(id, name, level) VALUES (2515, "building_glassworks", 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2515, 90.0, 3, 46.63252865340649);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (21, 2515, 15.0, 3, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (31, 2515, 30.0, 3, 7.772088108901082);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (35, 2515, 60.0, 3, 15.544176217802164);
INSERT INTO building(id, name, level) VALUES (2516, "building_fishing_wharf", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 2516, 0.2444950495049505, 2, 0.5764683710876918);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (8, 2516, 2.4450000000000003, 2, 2.4450000000000003);
INSERT INTO building(id, name, level) VALUES (2517, "building_rice_farm", 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 2517, 5.406836065573771, 3, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2517, 27.034196721311478, 3, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (37, 2517, 32.441032786885245, 3, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (42, 2517, 48.661557377049185, 3, 0.0);
INSERT INTO building(id, name, level) VALUES (2518, "building_tobacco_plantation", 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 2518, 67.83, 3, 82.7526);
INSERT INTO building(id, name, level) VALUES (2519, "building_barracks", 10);
INSERT INTO building(id, name, level) VALUES (2520, "building_government_administration", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 2520, 9.52, 1, 0.0);
INSERT INTO building(id, name, level) VALUES (2521, "building_shipyards", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (9, 2521, 15.936, 1, 48.17243710895769);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2521, 31.872, 1, 16.51413281379302);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (18, 2521, 27.888, 1, 21.168933106034448);
INSERT INTO building(id, name, level) VALUES (2522, "building_glassworks", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2522, 30.0, 1, 15.544176217802164);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (21, 2522, 5.0, 1, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (31, 2522, 10.0, 1, 2.5906960363003604);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (35, 2522, 20.0, 1, 5.181392072600721);
INSERT INTO building(id, name, level) VALUES (2523, "building_fishing_wharf", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 2523, 3.14229702970297, 2, 7.408881504367171);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (8, 2523, 31.423, 2, 31.423);
INSERT INTO building(id, name, level) VALUES (2524, "building_rice_farm", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2524, 9.4, 1, 11.28);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (37, 2524, 11.28, 1, 13.536);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (42, 2524, 16.919999999999998, 1, 20.304);
INSERT INTO building(id, name, level) VALUES (2525, "building_tobacco_plantation", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 2525, 48.865, 2, 59.12665);
INSERT INTO building(id, name, level) VALUES (2526, "building_barracks", 3);
INSERT INTO building(id, name, level) VALUES (2527, "building_port", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 2527, 5.0, 1, 11.788957941171311);
INSERT INTO building(id, name, level) VALUES (2528, "building_government_administration", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 2528, 20.0, 2, 0.0);
INSERT INTO building(id, name, level) VALUES (2529, "building_glassworks", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2529, 30.0, 1, 15.544176217802164);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (21, 2529, 5.0, 1, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (31, 2529, 10.0, 1, 2.5906960363003604);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (35, 2529, 20.0, 1, 5.181392072600721);
INSERT INTO building(id, name, level) VALUES (2530, "building_fishing_wharf", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 2530, 0.4335940594059406, 2, 1.0223244259756739);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (8, 2530, 4.336, 2, 4.336);
INSERT INTO building(id, name, level) VALUES (2531, "building_rice_farm", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 2531, 2.0, 1, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2531, 10.0, 1, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (37, 2531, 12.0, 1, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (42, 2531, 18.0, 1, 0.0);
INSERT INTO building(id, name, level) VALUES (2532, "building_tobacco_plantation", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 2532, 24.59, 1, 29.508);
INSERT INTO building(id, name, level) VALUES (2533, "building_barracks", 2);
INSERT INTO building(id, name, level) VALUES (2534, "building_government_administration", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 2534, 10.0, 1, 0.0);
INSERT INTO building(id, name, level) VALUES (2535, "building_rice_farm", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 2535, 2.0, 1, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2535, 10.0, 1, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (37, 2535, 12.0, 1, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (42, 2535, 18.0, 1, 0.0);
INSERT INTO building(id, name, level) VALUES (2536, "building_livestock_ranch", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (7, 2536, 2.998, 1, 5.479950238571549);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 2536, 2.998, 1, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 2536, 5.996, 1, 2.998);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (36, 2536, 11.992, 1, 5.996);
INSERT INTO building(id, name, level) VALUES (2537, "building_tobacco_plantation", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 2537, 50.0, 2, 50.5);
INSERT INTO building(id, name, level) VALUES (2538, "building_barracks", 5);
INSERT INTO building(id, name, level) VALUES (2539, "building_government_administration", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 2539, 20.0, 2, 0.0);
INSERT INTO building(id, name, level) VALUES (2540, "building_glassworks", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2540, 60.0, 2, 31.088352435604328);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (21, 2540, 10.0, 2, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (31, 2540, 20.0, 2, 5.181392072600721);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (35, 2540, 40.0, 2, 10.362784145201442);
INSERT INTO building(id, name, level) VALUES (2541, "building_iron_mine", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 2541, 5.0, 1, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (24, 2541, 20.0, 1, 0.0);
INSERT INTO building(id, name, level) VALUES (2542, "building_rice_farm", 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 2542, 6.0, 3, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2542, 30.0, 3, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (37, 2542, 36.0, 3, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (42, 2542, 54.0, 3, 0.0);
INSERT INTO building(id, name, level) VALUES (2543, "building_livestock_ranch", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (7, 2543, 4.642099009900989, 2, 8.485147290453527);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 2543, 4.642099009900989, 2, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 2543, 9.284198019801979, 2, 4.642099009900989);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (36, 2543, 18.568396039603957, 2, 9.284198019801979);
INSERT INTO building(id, name, level) VALUES (2544, "building_barracks", 10);
INSERT INTO building(id, name, level) VALUES (3492, "building_subsistence_rice_paddies", 64);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3492, 335.5369583333333, 64, 402.64435);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3492, 45.75503333333333, 64, 54.90604);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3492, 45.75503333333333, 64, 54.90604);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3492, 61.00671666666667, 64, 73.20806);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3492, 61.00671666666667, 64, 73.20806);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3492, 61.00671666666667, 64, 73.20806);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3492, 61.00671666666667, 64, 73.20806);
INSERT INTO building(id, name, level) VALUES (3493, "building_urban_center", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 3493, 1.1771980198019802, 2, 0.6099524487683248);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (31, 3493, 1.1771980198019802, 2, 1.9032203803050454);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3493, 23.544, 2, 17.87153474786557);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (16, 3493, 5.886, 2, 4.467883686966393);
INSERT INTO building(id, name, level) VALUES (3494, "building_subsistence_rice_paddies", 82);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3494, 447.72122500000006, 82, 537.26547);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3494, 61.05289166666667, 82, 73.26347);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3494, 61.05289166666667, 82, 73.26347);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3494, 81.40385833333333, 82, 97.68463);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3494, 81.40385833333333, 82, 97.68463);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3494, 81.40385833333333, 82, 97.68463);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3494, 81.40385833333333, 82, 97.68463);
INSERT INTO building(id, name, level) VALUES (3495, "building_subsistence_rice_paddies", 108);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3495, 589.9786153846154, 108, 766.9722);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3495, 80.45162307692307, 108, 104.58711);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3495, 80.45162307692307, 108, 104.58711);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3495, 107.26883846153845, 108, 139.44949);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3495, 107.26883846153845, 108, 139.44949);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3495, 107.26883846153845, 108, 139.44949);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3495, 107.26883846153845, 108, 139.44949);
INSERT INTO building(id, name, level) VALUES (3496, "building_subsistence_rice_paddies", 36);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3496, 194.39244, 36, 194.39244);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3496, 26.50806, 36, 26.50806);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3496, 26.50806, 36, 26.50806);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3496, 35.34408, 36, 35.34408);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3496, 35.34408, 36, 35.34408);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3496, 35.34408, 36, 35.34408);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3496, 35.34408, 36, 35.34408);
INSERT INTO building(id, name, level) VALUES (3497, "building_subsistence_rice_paddies", 95);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3497, 464.58087, 95, 464.58087);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3497, 63.35193, 95, 63.35193);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3497, 63.35193, 95, 63.35193);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3497, 84.46925, 95, 84.46925);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3497, 84.46925, 95, 84.46925);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3497, 84.46925, 95, 84.46925);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3497, 84.46925, 95, 84.46925);
INSERT INTO building(id, name, level) VALUES (3498, "building_urban_center", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3498, 9.435, 1, 9.435);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (16, 3498, 3.145, 1, 3.145);
INSERT INTO building(id, name, level) VALUES (4282, "building_conscription_center", 25);
INSERT INTO building(id, name, level) VALUES (4512, "building_conscription_center", 16);
INSERT INTO building(id, name, level) VALUES (4689, "building_conscription_center", 7);
INSERT INTO building(id, name, level) VALUES (4977, "building_conscription_center", 2);
INSERT INTO building(id, name, level) VALUES (4991, "building_conscription_center", 3);
INSERT INTO building(id, name, level) VALUES (16782756, "building_construction_sector", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (9, 16782756, 25.0, 1, 75.57171986219517);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 16782756, 75.0, 1, 38.86044054450541);
INSERT INTO building(id, name, level) VALUES (16782876, "building_construction_sector", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (9, 16782876, 4.335, 1, 13.104136224104641);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 16782876, 13.005, 1, 6.7384003904172385);
INSERT INTO building(id, name, level) VALUES (5734, "building_urban_center", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 5734, 2.19, 1, 2.19);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (16, 5734, 0.73, 1, 0.73);
INSERT INTO building(id, name, level) VALUES (5891, "building_construction_sector", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (9, 5891, 4.1, 1, 12.393762057400007);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 5891, 12.3, 1, 6.373112249298887);
