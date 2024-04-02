
  
CREATE TABLE goods(    goods_name    VARCHAR(30),    code    INT,    base_price FLOAT,    current_price FLOAT,    pop_demand FLOAT, PRIMARY KEY (code));

CREATE TABLE building(    id INT,    name VARCHAR(80),    level INT, PRIMARY KEY (id));

CREATE TABLE supply(    goods_id INT,    building_id INT,    max_supply FLOAT,    current_output FLOAT,    level INT, PRIMARY KEY (goods_id, building_id));

CREATE TABLE demand(    goods_id INT,    building_id INT,    max_demand FLOAT,    current_input FLOAT,    level INT,   PRIMARY KEY (goods_id, building_id));
    
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("ammunition", 0, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("small_arms", 1, 60, 60, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("artillery", 2, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tanks", 3, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("aeroplanes", 4, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("manowars", 5, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("ironclads", 6, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("grain", 7, 20, 14.928503959854776, 2697.6855993758427);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fish", 8, 20, 15.988704914281108, 311.3466392379647);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fabric", 9, 20, 17.183864417311497, 270.61876890331564);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("wood", 10, 20, 21.38947556357373, 298.2910640693691);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("groceries", 11, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("clothes", 12, 30, 25.72446202194884, 673.4275991153916);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("furniture", 13, 30, 25.68507268257546, 589.9017565217957);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("paper", 14, 30, 33.44487363374719, 42.59382598810693);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("services", 15, 30, 13.386849729540023, 255.43991666666676);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("transportation", 16, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("electricity", 17, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("clippers", 18, 60, 52.074269228137894, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("steamers", 19, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("silk", 20, 40, 32.25651373968781, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("dye", 21, 40, 27.787686177781996, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("sulfur", 22, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("coal", 23, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("iron", 24, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("lead", 25, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("hardwood", 26, 40, 24.563106796116504, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("rubber", 27, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("oil", 28, 40, 24.422270603993333, 19.229694138657777);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("engines", 29, 60, 60, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("steel", 30, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("glass", 31, 40, 27.847218007966408, 28.36768149661944);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fertilizer", 32, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tools", 33, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("explosives", 34, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("porcelain", 35, 70, 83.18985740932156, 159.20960362917452);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("meat", 36, 30, 43.306326349734206, 122.56058272934494);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fruit", 37, 30, 43.270747935972366, 146.80426058368226);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("liquor", 38, 30, 23.22581535664309, 714.0143403451674);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("wine", 39, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tea", 40, 50, 33.82792864914794, 244.9415350000001);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("coffee", 41, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("sugar", 42, 30, 31.23099425093683, 67.32797089318926);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tobacco", 43, 40, 33.36846235958461, 294.81652112851947);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("opium", 44, 50, 87.5, 0.955356890084224);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("automobiles", 45, 100, 100, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("telephones", 46, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("radios", 47, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("luxury_clothes", 48, 60, 75.67931986104479, 184.1703526114868);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("luxury_furniture", 49, 60, 76.20936172018757, 60.58986815447622);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("gold", 50, 100, 100, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fine_art", 51, 200, 200, 0);
INSERT INTO building(id, name, level) VALUES (2616, "building_barrackslevel", 2);
INSERT INTO building(id, name, level) VALUES (2617, "building_government_administrationlevel", 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 2617, 29.7, 25.15276680345371, 3);
INSERT INTO building(id, name, level) VALUES (2618, "building_logging_camplevel", 5);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 2618, 150.0, 156.0, 5);
INSERT INTO building(id, name, level) VALUES (2619, "building_rice_farmlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2619, 34.86, 34.86, 1);
INSERT INTO building(id, name, level) VALUES (2620, "building_tobacco_plantationlevel", 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 2620, 74.7, 76.194, 3);
INSERT INTO building(id, name, level) VALUES (2621, "building_barrackslevel", 15);
INSERT INTO building(id, name, level) VALUES (2622, "building_government_administrationlevel", 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 2622, 29.7, 25.15276680345371, 3);
INSERT INTO building(id, name, level) VALUES (2623, "building_glassworkslevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2623, 30.0, 27.22104887285254, 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (21, 2623, 15.0, 25.2984, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (31, 2623, 10.0, 9.536841478808757, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (35, 2623, 25.0, 23.84210369702189, 1);
INSERT INTO building(id, name, level) VALUES (2624, "building_fishing_wharflevel", 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 2624, 15.0, 18.206697368634895, 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (8, 2624, 150.0, 150.0, 3);
INSERT INTO building(id, name, level) VALUES (2625, "building_whaling_stationlevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 2625, 10.0, 12.137798245756597, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (28, 2625, 40.0, 40.0, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (36, 2625, 20.0, 20.0, 2);
INSERT INTO building(id, name, level) VALUES (2626, "building_rice_farmlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2626, 69.72, 70.4172, 2);
INSERT INTO building(id, name, level) VALUES (2627, "building_tobacco_plantationlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 2627, 49.800000000000004, 50.298, 2);
INSERT INTO building(id, name, level) VALUES (2628, "building_tea_plantationlevel", 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (40, 2628, 79.68, 82.0704, 4);
INSERT INTO building(id, name, level) VALUES (2629, "building_portlevel", 1);
INSERT INTO building(id, name, level) VALUES (2630, "building_barrackslevel", 20);
INSERT INTO building(id, name, level) VALUES (2631, "building_government_administrationlevel", 5);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 2631, 49.49999999999999, 41.92127800575618, 5);
INSERT INTO building(id, name, level) VALUES (2632, "building_construction_sectorlevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (9, 2632, 25.0, 30.778412099463253, 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2632, 75.0, 68.05262218213134, 1);
INSERT INTO building(id, name, level) VALUES (2633, "building_paper_millslevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2633, 60.0, 54.44209774570508, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (14, 2633, 80.0, 72.5894636609401, 2);
INSERT INTO building(id, name, level) VALUES (2634, "building_furniture_manufacturieslevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (9, 2634, 20.0, 24.622729679570604, 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2634, 40.0, 36.29473183047005, 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (26, 2634, 20.0, 41.2, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 2634, 50.0, 48.45613826269585, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (49, 2634, 40.0, 38.76491061015668, 2);
INSERT INTO building(id, name, level) VALUES (2635, "building_logging_camplevel", 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 2635, 40.0, 41.2, 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (26, 2635, 40.0, 41.2, 4);
INSERT INTO building(id, name, level) VALUES (2636, "building_livestock_ranchlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 2636, 59.76, 60.3576, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (36, 2636, 9.959999999999999, 10.0596, 2);
INSERT INTO building(id, name, level) VALUES (2637, "building_rice_farmlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2637, 39.839999999999996, 40.2384, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (37, 2637, 11.952, 12.07152, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (42, 2637, 17.928, 18.10728, 2);
INSERT INTO building(id, name, level) VALUES (2638, "building_tobacco_plantationlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 2638, 49.800000000000004, 50.298, 2);
INSERT INTO building(id, name, level) VALUES (2639, "building_tea_plantationlevel", 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (40, 2639, 79.68, 82.0704, 4);
INSERT INTO building(id, name, level) VALUES (2640, "building_barrackslevel", 15);
INSERT INTO building(id, name, level) VALUES (2641, "building_government_administrationlevel", 7);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 2641, 69.3, 58.68978920805865, 7);
INSERT INTO building(id, name, level) VALUES (2642, "building_construction_sectorlevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (9, 2642, 25.0, 30.778412099463253, 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2642, 75.0, 68.05262218213134, 1);
INSERT INTO building(id, name, level) VALUES (2643, "building_textile_millslevel", 4);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (9, 2643, 119.99999999999999, 147.73637807742358, 4);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (20, 2643, 40.0, 53.9168, 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 2643, 100.0, 100.0, 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (48, 2643, 80.0, 80.0, 4);
INSERT INTO building(id, name, level) VALUES (2644, "building_paper_millslevel", 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2644, 90.0, 81.66314661855762, 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (14, 2644, 120.0, 108.88419549141015, 3);
INSERT INTO building(id, name, level) VALUES (2645, "building_fishing_wharflevel", 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 2645, 15.0, 18.206697368634895, 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (8, 2645, 150.0, 150.0, 3);
INSERT INTO building(id, name, level) VALUES (2646, "building_livestock_ranchlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 2646, 59.76, 60.3576, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (36, 2646, 9.959999999999999, 10.0596, 2);
INSERT INTO building(id, name, level) VALUES (2647, "building_rice_farmlevel", 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2647, 59.76, 60.9552, 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (37, 2647, 17.928, 18.28656, 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (42, 2647, 26.892, 27.42984, 3);
INSERT INTO building(id, name, level) VALUES (2648, "building_silk_plantationlevel", 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (20, 2648, 59.76, 60.9552, 3);
INSERT INTO building(id, name, level) VALUES (2649, "building_tobacco_plantationlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 2649, 49.800000000000004, 50.298, 2);
INSERT INTO building(id, name, level) VALUES (2650, "building_tea_plantationlevel", 5);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (40, 2650, 99.6, 103.584, 5);
INSERT INTO building(id, name, level) VALUES (2651, "building_barrackslevel", 20);
INSERT INTO building(id, name, level) VALUES (2652, "building_government_administrationlevel", 4);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 2652, 39.599999999999994, 33.53702240460494, 4);
INSERT INTO building(id, name, level) VALUES (2653, "building_shipyardslevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (9, 2653, 40.0, 49.24545935914121, 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2653, 80.0, 72.5894636609401, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (18, 2653, 70.0, 66.75789035166129, 2);
INSERT INTO building(id, name, level) VALUES (2654, "building_textile_millslevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (9, 2654, 60.0, 73.8681890387118, 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (20, 2654, 20.0, 26.9584, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 2654, 50.0, 50.0, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (48, 2654, 40.0, 40.0, 2);
INSERT INTO building(id, name, level) VALUES (2655, "building_glassworkslevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2655, 30.0, 27.22104887285254, 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (21, 2655, 15.0, 25.2984, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (31, 2655, 10.0, 9.536841478808757, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (35, 2655, 25.0, 23.84210369702189, 1);
INSERT INTO building(id, name, level) VALUES (2656, "building_fishing_wharflevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 2656, 10.0, 12.137798245756597, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (8, 2656, 100.0, 100.0, 2);
INSERT INTO building(id, name, level) VALUES (2657, "building_rice_farmlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2657, 69.72, 70.4172, 2);
INSERT INTO building(id, name, level) VALUES (2658, "building_dye_plantationlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (21, 2658, 49.800000000000004, 50.298, 2);
INSERT INTO building(id, name, level) VALUES (2659, "building_tobacco_plantationlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 2659, 49.800000000000004, 50.298, 2);
INSERT INTO building(id, name, level) VALUES (2660, "building_tea_plantationlevel", 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (40, 2660, 79.68, 82.0704, 4);
INSERT INTO building(id, name, level) VALUES (2661, "building_barrackslevel", 15);
INSERT INTO building(id, name, level) VALUES (2662, "building_portlevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 2662, 5.0, 6.068899122878299, 1);
INSERT INTO building(id, name, level) VALUES (2663, "building_fishing_wharflevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (8, 2663, 25.0, 25.0, 1);
INSERT INTO building(id, name, level) VALUES (2664, "building_livestock_ranchlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 2664, 29.88, 29.88, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (36, 2664, 4.98, 4.98, 1);
INSERT INTO building(id, name, level) VALUES (2665, "building_portlevel", 1);
INSERT INTO building(id, name, level) VALUES (2666, "building_government_administrationlevel", 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 2666, 29.7, 25.15276680345371, 3);
INSERT INTO building(id, name, level) VALUES (2667, "building_paper_millslevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2667, 60.0, 54.44209774570508, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (14, 2667, 80.0, 72.5894636609401, 2);
INSERT INTO building(id, name, level) VALUES (2668, "building_glassworkslevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2668, 30.0, 27.22104887285254, 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (21, 2668, 15.0, 25.2984, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (31, 2668, 10.0, 9.536841478808757, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (35, 2668, 25.0, 23.84210369702189, 1);
INSERT INTO building(id, name, level) VALUES (2669, "building_logging_camplevel", 6);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 2669, 180.0, 189.0, 6);
INSERT INTO building(id, name, level) VALUES (2670, "building_livestock_ranchlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 2670, 29.88, 29.88, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (36, 2670, 4.98, 4.98, 1);
INSERT INTO building(id, name, level) VALUES (2671, "building_rice_farmlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2671, 39.839999999999996, 40.2384, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (37, 2671, 11.952, 12.07152, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (42, 2671, 17.928, 18.10728, 2);
INSERT INTO building(id, name, level) VALUES (2672, "building_silk_plantationlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (20, 2672, 19.92, 19.92, 1);
INSERT INTO building(id, name, level) VALUES (2673, "building_tobacco_plantationlevel", 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 2673, 74.7, 76.194, 3);
INSERT INTO building(id, name, level) VALUES (2674, "building_tea_plantationlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (40, 2674, 19.92, 19.92, 1);
INSERT INTO building(id, name, level) VALUES (2675, "building_barrackslevel", 10);
INSERT INTO building(id, name, level) VALUES (2676, "building_government_administrationlevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 2676, 9.9, 8.384255601151237, 1);
INSERT INTO building(id, name, level) VALUES (2677, "building_glassworkslevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2677, 60.0, 54.44209774570508, 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (21, 2677, 30.0, 50.5968, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (31, 2677, 20.0, 19.073682957617514, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (35, 2677, 50.0, 47.68420739404378, 2);
INSERT INTO building(id, name, level) VALUES (2678, "building_rice_farmlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2678, 34.86, 34.86, 1);
INSERT INTO building(id, name, level) VALUES (2679, "building_dye_plantationlevel", 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (21, 2679, 74.7, 76.194, 3);
INSERT INTO building(id, name, level) VALUES (2680, "building_tobacco_plantationlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 2680, 24.9, 24.9, 1);
INSERT INTO building(id, name, level) VALUES (2681, "building_tea_plantationlevel", 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (40, 2681, 59.76, 60.9552, 3);
INSERT INTO building(id, name, level) VALUES (2682, "building_barrackslevel", 5);
INSERT INTO building(id, name, level) VALUES (3680, "building_subsistence_rice_paddieslevel", 7);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3680, 1.49264, 1.49264, 7);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3680, 0.20354, 0.20354, 7);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3680, 0.20354, 0.20354, 7);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3680, 0.27139, 0.27139, 7);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3680, 0.27139, 0.27139, 7);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3680, 0.27139, 0.27139, 7);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3680, 0.40708, 0.40708, 7);
INSERT INTO building(id, name, level) VALUES (3681, "building_subsistence_rice_paddieslevel", 76);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3681, 407.81752, 407.81752, 76);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3681, 55.61148, 55.61148, 76);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3681, 55.61148, 55.61148, 76);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3681, 74.14864, 74.14864, 76);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3681, 74.14864, 74.14864, 76);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3681, 74.14864, 74.14864, 76);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3681, 111.22296, 111.22296, 76);
INSERT INTO building(id, name, level) VALUES (3682, "building_urban_centerlevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 3682, 5.0, 4.536841478808756, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3682, 25.0, 22.68420739404378, 1);
INSERT INTO building(id, name, level) VALUES (3683, "building_subsistence_rice_paddieslevel", 122);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3683, 648.69596, 648.69596, 122);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3683, 88.45854, 88.45854, 122);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3683, 88.45854, 88.45854, 122);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3683, 117.94472, 117.94472, 122);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3683, 117.94472, 117.94472, 122);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3683, 117.94472, 117.94472, 122);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3683, 176.91708, 176.91708, 122);
INSERT INTO building(id, name, level) VALUES (3684, "building_urban_centerlevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 3684, 5.0, 4.536841478808756, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3684, 25.0, 22.68420739404378, 1);
INSERT INTO building(id, name, level) VALUES (3685, "building_subsistence_rice_paddieslevel", 139);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3685, 725.85452, 725.85452, 139);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3685, 98.98016, 98.98016, 139);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3685, 98.98016, 98.98016, 139);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3685, 131.97355, 131.97355, 139);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3685, 131.97355, 131.97355, 139);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3685, 131.97355, 131.97355, 139);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3685, 197.96032, 197.96032, 139);
INSERT INTO building(id, name, level) VALUES (3686, "building_urban_centerlevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 3686, 10.0, 9.073682957617512, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3686, 50.0, 45.36841478808756, 2);
INSERT INTO building(id, name, level) VALUES (3687, "building_subsistence_rice_paddieslevel", 174);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3687, 955.12428, 955.12428, 174);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3687, 130.24422, 130.24422, 174);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3687, 130.24422, 130.24422, 174);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3687, 173.65896, 173.65896, 174);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3687, 173.65896, 173.65896, 174);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3687, 173.65896, 173.65896, 174);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3687, 260.48844, 260.48844, 174);
INSERT INTO building(id, name, level) VALUES (3688, "building_urban_centerlevel", 4);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 3688, 20.0, 18.147365915235024, 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3688, 100.0, 90.73682957617513, 4);
INSERT INTO building(id, name, level) VALUES (3689, "building_subsistence_rice_paddieslevel", 90);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3689, 494.01, 494.01, 90);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3689, 67.365, 67.365, 90);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3689, 67.365, 67.365, 90);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3689, 89.82, 89.82, 90);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3689, 89.82, 89.82, 90);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3689, 89.82, 89.82, 90);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3689, 134.73, 134.73, 90);
INSERT INTO building(id, name, level) VALUES (3690, "building_urban_centerlevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 3690, 10.0, 9.073682957617512, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3690, 50.0, 45.36841478808756, 2);
INSERT INTO building(id, name, level) VALUES (3691, "building_subsistence_orchardslevel", 14);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3691, 5.3578, 5.3578, 14);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3691, 2.6789, 2.6789, 14);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3691, 8.0367, 8.0367, 14);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3691, 5.3578, 5.3578, 14);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3691, 5.3578, 5.3578, 14);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3691, 5.3578, 5.3578, 14);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (37, 3691, 17.78789, 17.78789, 14);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3691, 7.50092, 7.50092, 14);
INSERT INTO building(id, name, level) VALUES (3692, "building_subsistence_rice_paddieslevel", 67);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3692, 313.82197, 313.82197, 67);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3692, 42.7939, 42.7939, 67);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3692, 42.7939, 42.7939, 67);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3692, 57.05854, 57.05854, 67);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3692, 57.05854, 57.05854, 67);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3692, 57.05854, 57.05854, 67);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3692, 85.58781, 85.58781, 67);
INSERT INTO building(id, name, level) VALUES (3693, "building_urban_centerlevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 3693, 10.0, 9.073682957617512, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3693, 50.0, 45.36841478808756, 2);
INSERT INTO building(id, name, level) VALUES (3694, "building_subsistence_rice_paddieslevel", 32);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3694, 171.50672, 171.50672, 32);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3694, 23.38728, 23.38728, 32);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3694, 23.38728, 23.38728, 32);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3694, 31.18304, 31.18304, 32);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3694, 31.18304, 31.18304, 32);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3694, 31.18304, 31.18304, 32);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3694, 46.77456, 46.77456, 32);
INSERT INTO building(id, name, level) VALUES (3695, "building_urban_centerlevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 3695, 5.0, 4.536841478808756, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3695, 25.0, 22.68420739404378, 1);
INSERT INTO building(id, name, level) VALUES (4502, "building_conscription_centerlevel", 16);
INSERT INTO building(id, name, level) VALUES (4503, "building_conscription_centerlevel", 25);
INSERT INTO building(id, name, level) VALUES (4504, "building_conscription_centerlevel", 25);
INSERT INTO building(id, name, level) VALUES (4505, "building_conscription_centerlevel", 25);
INSERT INTO building(id, name, level) VALUES (4506, "building_conscription_centerlevel", 20);
INSERT INTO building(id, name, level) VALUES (4507, "building_conscription_centerlevel", 1);
INSERT INTO building(id, name, level) VALUES (4508, "building_conscription_centerlevel", 13);
INSERT INTO building(id, name, level) VALUES (4509, "building_conscription_centerlevel", 7);