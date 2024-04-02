
  
CREATE TABLE goods(    goods_name    VARCHAR(30),    code    INT,    base_price FLOAT,    current_price FLOAT,    pop_demand FLOAT, PRIMARY KEY (code));

CREATE TABLE building(    id INT,    name VARCHAR(80),    level INT, PRIMARY KEY (id));

CREATE TABLE supply(    goods_id INT,    building_id INT,    max_supply FLOAT,    current_output FLOAT,    level INT, PRIMARY KEY (goods_id, building_id));

CREATE TABLE demand(    goods_id INT,    building_id INT,    max_demand FLOAT,    current_input FLOAT,    level INT,   PRIMARY KEY (goods_id, building_id));
    
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("ammunition", 0, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("small_arms", 1, 60, 45.94707391780537, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("artillery", 2, 70, 53.604919570772935, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tanks", 3, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("aeroplanes", 4, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("manowars", 5, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("ironclads", 6, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("grain", 7, 20, 28.64323555749042, 1490.0615505303251);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fish", 8, 20, 35.0, 37.55505050741982);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fabric", 9, 20, 24.597459136175335, 61.928927714733824);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("wood", 10, 20, 13.36218425918943, 152.65963805857606);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("groceries", 11, 30, 41.865186178746015, 63.910015791211684);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("clothes", 12, 30, 47.33060049509756, 549.1578185814863);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("furniture", 13, 30, 44.071837601205374, 447.44183284489856);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("paper", 14, 30, 49.47331149555429, 65.18534739973761);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("services", 15, 30, 11.71334971356464, 142.8804866658084);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("transportation", 16, 30, 20.668070830646485, 42.368210172922524);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("electricity", 17, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("clippers", 18, 60, 105.0, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("steamers", 19, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("silk", 20, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("dye", 21, 40, 70.0, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("sulfur", 22, 50, 87.5, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("coal", 23, 30, 37.41098871325009, 27.8863311511267);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("iron", 24, 40, 41.337550369918574, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("lead", 25, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("hardwood", 26, 40, 29.957500000000003, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("rubber", 27, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("oil", 28, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("engines", 29, 60, 105.0, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("steel", 30, 50, 30.240150576889953, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("glass", 31, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fertilizer", 32, 30, 18.65284167903465, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tools", 33, 40, 30.676902022546418, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("explosives", 34, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("porcelain", 35, 70, 122.5, 13.82010431514969);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("meat", 36, 30, 18.397703451502633, 39.88683960220663);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fruit", 37, 30, 22.120783117549042, 40.29873793463489);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("liquor", 38, 30, 47.594405481706026, 513.3022624999999);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("wine", 39, 50, 70.23784344800688, 130.84482088018683);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tea", 40, 50, 87.5, 5.803279119813188);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("coffee", 41, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("sugar", 42, 30, 42.61597182796612, 14.115376239462377);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tobacco", 43, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("opium", 44, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("automobiles", 45, 100, 100, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("telephones", 46, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("radios", 47, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("luxury_clothes", 48, 60, 105.0, 37.624125524261565);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("luxury_furniture", 49, 60, 85.67168037525121, 128.98764027473047);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("gold", 50, 100, 100, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fine_art", 51, 200, 350.0, 0.7042666666666667);
INSERT INTO building(id, name, level) VALUES (356, "building_government_administrationlevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 356, 20.0, 2.690389781729522, 1);
INSERT INTO building(id, name, level) VALUES (357, "building_steel_millslevel", 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (23, 357, 89.99999999999999, 60.35604514699963, 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (24, 357, 120.0, 114.64979852032572, 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (30, 357, 195.0, 158.5386768736809, 3);
INSERT INTO building(id, name, level) VALUES (358, "building_construction_sectorlevel", 2);
INSERT INTO building(id, name, level) VALUES (359, "building_chemical_plantslevel", 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (22, 359, 89.99999999999999, 0.0, 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (24, 359, 30.0, 28.66244963008143, 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (32, 359, 269.99999999999994, 128.9810233353664, 3);
INSERT INTO building(id, name, level) VALUES (360, "building_tooling_workshopslevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 360, 59.99999999999999, 107.62738204566179, 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (30, 360, 39.99999999999999, 84.55396099929646, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (33, 360, 159.99999999999997, 159.99999999999997, 2);
INSERT INTO building(id, name, level) VALUES (361, "building_coal_minelevel", 6);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 361, 59.99999999999999, 87.05366007138069, 6);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (23, 361, 239.99999999999997, 239.99999999999997, 6);
INSERT INTO building(id, name, level) VALUES (362, "building_iron_minelevel", 6);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (23, 362, 60.0, 40.237363431333094, 6);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 362, 60.0, 87.0536600713807, 6);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (24, 362, 240.0, 200.4747268626662, 6);
INSERT INTO building(id, name, level) VALUES (363, "building_wheat_farmlevel", 8);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (32, 363, 37.644393162393165, 75.94466688665119, 8);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 363, 7.528871794871796, 10.923597432529586, 8);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 363, 263.51079487179493, 263.51079487179493, 8);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (39, 363, 60.23103418803419, 60.23103418803419, 8);
INSERT INTO building(id, name, level) VALUES (364, "building_logging_camplevel", 6);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 364, 29.999999999999996, 43.526830035690345, 6);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 364, 239.99999999999997, 239.99999999999997, 6);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (26, 364, 59.99999999999999, 59.99999999999999, 6);
INSERT INTO building(id, name, level) VALUES (365, "building_railwaylevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 365, 5.0, 8.968948503805148, 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (23, 365, 10.0, 6.706227238555515, 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (29, 365, 10.0, 0.0, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (16, 365, 65.0, 36.19682568353695, 1);
INSERT INTO building(id, name, level) VALUES (366, "building_barrackslevel", 5);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (1, 366, 5.0, 7.270477351028217, 5);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (2, 366, 5.0, 7.270477351028217, 5);
INSERT INTO building(id, name, level) VALUES (367, "building_government_administrationlevel", 6);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 367, 60.0, 8.071169345188567, 6);
INSERT INTO building(id, name, level) VALUES (368, "building_construction_sectorlevel", 1);
INSERT INTO building(id, name, level) VALUES (369, "building_paper_millslevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 369, 29.999999999999996, 53.813691022830895, 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (22, 369, 10.0, 0.0, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (14, 369, 70.0, 35.0, 1);
INSERT INTO building(id, name, level) VALUES (370, "building_food_industrylevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (7, 370, 79.99999999999999, 33.9027436933844, 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (42, 370, 79.99999999999999, 35.14321127834267, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (11, 370, 70.0, 30.207605300130602, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 370, 119.99999999999999, 51.78446622879531, 2);
INSERT INTO building(id, name, level) VALUES (371, "building_arms_industrylevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (24, 371, 19.83, 18.945879205483823, 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (26, 371, 9.915, 14.904171364148812, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (1, 371, 14.872499999999997, 14.540954702056432, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (2, 371, 14.872499999999997, 14.540954702056432, 1);
INSERT INTO building(id, name, level) VALUES (372, "building_universitylevel", 16);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 372, 80.0, 10.761559126918089, 16);
INSERT INTO building(id, name, level) VALUES (373, "building_textile_millslevel", 4);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (9, 373, 160.00000000000003, 110.96043588079644, 4);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (21, 373, 20.000000000000004, 0.0, 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 373, 240.0, 83.22032691059731, 4);
INSERT INTO building(id, name, level) VALUES (374, "building_furniture_manufacturieslevel", 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (9, 374, 30.0, 20.805081727649327, 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 374, 60.0, 107.62738204566179, 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (26, 374, 30.0, 45.09582863585118, 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 374, 15.0, 21.763415017845176, 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 374, 134.99999999999997, 124.65571694360546, 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (49, 374, 60.0, 55.40254086382466, 3);
INSERT INTO building(id, name, level) VALUES (375, "building_logging_camplevel", 10);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 375, 50.0, 72.54471672615058, 10);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 375, 600.0, 600.0, 10);
INSERT INTO building(id, name, level) VALUES (376, "building_fishing_wharflevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 376, 5.0, 0.0, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (8, 376, 50.0, 0.0, 1);
INSERT INTO building(id, name, level) VALUES (377, "building_wheat_farmlevel", 7);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (32, 377, 34.45329310344828, 69.50686803748161, 7);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 377, 6.890655172413793, 9.997612550806858, 7);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 377, 206.7197931034483, 206.7197931034483, 7);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (37, 377, 62.01593965517242, 62.01593965517242, 7);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (42, 377, 41.343956896551724, 41.343956896551724, 7);
INSERT INTO building(id, name, level) VALUES (378, "building_livestock_ranchlevel", 5);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (7, 378, 46.2725, 19.609558844401626, 5);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 378, 46.2725, 67.13650809421605, 5);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 378, 185.09, 131.76411768880325, 5);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (32, 378, 23.13624561403509, 16.470511588766424, 5);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (36, 378, 115.6812456140351, 82.35257043316805, 5);
INSERT INTO building(id, name, level) VALUES (379, "building_railwaylevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 379, 5.0, 8.968948503805148, 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (23, 379, 10.0, 6.706227238555515, 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (29, 379, 10.0, 0.0, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (16, 379, 65.0, 36.19682568353695, 1);
INSERT INTO building(id, name, level) VALUES (380, "building_barrackslevel", 5);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (1, 380, 5.0, 7.270477351028217, 5);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (2, 380, 5.0, 7.270477351028217, 5);
INSERT INTO building(id, name, level) VALUES (381, "building_portlevel", 4);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 381, 20.0, 0.0, 4);
INSERT INTO building(id, name, level) VALUES (3250, "building_subsistence_farmslevel", 70);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3250, 100.4675, 110.51425, 70);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3250, 20.0935, 22.10285, 70);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3250, 20.0935, 22.10285, 70);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3250, 20.0935, 22.10285, 70);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3250, 20.0935, 22.10285, 70);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3250, 20.0935, 22.10285, 70);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3250, 28.130899999999997, 30.94399, 70);
INSERT INTO building(id, name, level) VALUES (3251, "building_urban_centerlevel", 5);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 3251, 24.571, 44.07520673739927, 5);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3251, 122.85499999999999, 122.85499999999999, 5);
INSERT INTO building(id, name, level) VALUES (3252, "building_subsistence_farmslevel", 108);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3252, 94.7565, 104.23215, 108);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3252, 18.9513, 20.84643, 108);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3252, 18.9513, 20.84643, 108);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3252, 18.9513, 20.84643, 108);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3252, 18.9513, 20.84643, 108);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3252, 18.9513, 20.84643, 108);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3252, 26.531818181818178, 29.185, 108);
INSERT INTO building(id, name, level) VALUES (3253, "building_urban_centerlevel", 14);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 3253, 64.995, 116.58736160096313, 14);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (23, 3253, 129.99, 87.17424787398316, 14);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3253, 714.945, 597.2016816534538, 14);
INSERT INTO building(id, name, level) VALUES (3904, "building_trade_centerlevel", 109);
INSERT INTO building(id, name, level) VALUES (4164, "building_conscription_centerlevel", 34);
INSERT INTO building(id, name, level) VALUES (4165, "building_conscription_centerlevel", 53);
INSERT INTO building(id, name, level) VALUES (4715, "building_tooling_workshopslevel", 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 4715, 89.99999999999999, 161.44107306849267, 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (30, 4715, 60.0, 126.83094149894474, 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (33, 4715, 240.0, 240.0, 3);
INSERT INTO building(id, name, level) VALUES (16782025, "building_universitylevel", 7);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 16782025, 35.0, 4.708182118026664, 7);
INSERT INTO building(id, name, level) VALUES (50336965, "building_steel_millslevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (23, 50336965, 29.999999999999996, 20.118681715666543, 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (24, 50336965, 40.0, 38.21659950677524, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (30, 50336965, 65.0, 52.846225624560304, 1);