
  
CREATE TABLE goods(    goods_name    VARCHAR(30),    code    INT,    base_price FLOAT,    current_price FLOAT,    pop_demand FLOAT, PRIMARY KEY (code));

CREATE TABLE building(    id INT,    name VARCHAR(80),    level INT, PRIMARY KEY (id));

CREATE TABLE supply(    goods_id INT,    building_id INT,    max_supply FLOAT,    current_output FLOAT,    level INT, PRIMARY KEY (goods_id, building_id));

CREATE TABLE demand(    goods_id INT,    building_id INT,    max_demand FLOAT,    current_input FLOAT,    level INT,   PRIMARY KEY (goods_id, building_id));
    
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("ammunition", 0, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("small_arms", 1, 60, 60, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("artillery", 2, 70, 122.5, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tanks", 3, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("aeroplanes", 4, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("manowars", 5, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("ironclads", 6, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("grain", 7, 20, 16.504180043576294, 1358.94018722171);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fish", 8, 20, 7.876623730313026, 36.6743983026459);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fabric", 9, 20, 10.831664246785788, 140.39083904361547);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("wood", 10, 20, 27.031425005721577, 104.49296345638463);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("groceries", 11, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("clothes", 12, 30, 39.481127795955835, 381.1495244924954);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("furniture", 13, 30, 38.61713049897194, 357.42876857212707);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("paper", 14, 30, 52.5, 11.920047179999996);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("services", 15, 30, 18.821813764755454, 138.3840633333334);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("transportation", 16, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("electricity", 17, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("clippers", 18, 60, 87.73573193969622, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("steamers", 19, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("silk", 20, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("dye", 21, 40, 70.0, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("sulfur", 22, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("coal", 23, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("iron", 24, 40, 70.0, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("lead", 25, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("hardwood", 26, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("rubber", 27, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("oil", 28, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("engines", 29, 60, 60, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("steel", 30, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("glass", 31, 40, 20.391650910031576, 11.040886612126432);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fertilizer", 32, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tools", 33, 40, 70.0, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("explosives", 34, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("porcelain", 35, 70, 76.91722907063371, 45.88906934243646);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("meat", 36, 30, 38.739664774508114, 18.149993870594255);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fruit", 37, 30, 31.046969911798513, 43.42043973136907);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("liquor", 38, 30, 30.174698578211785, 311.2014668352686);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("wine", 39, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tea", 40, 50, 87.5, 95.68881022550424);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("coffee", 41, 50, 87.5, 0.6347357744958442);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("sugar", 42, 30, 9.975119034673472, 6.831328535698783);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tobacco", 43, 40, 14.367836541143166, 32.64114385268423);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("opium", 44, 50, 87.5, 57.88036081669155);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("automobiles", 45, 100, 100, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("telephones", 46, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("radios", 47, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("luxury_clothes", 48, 60, 105.0, 16.34090638838603);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("luxury_furniture", 49, 60, 105.0, 41.024254378771474);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("gold", 50, 100, 100, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fine_art", 51, 200, 200, 0);
INSERT INTO building(id, name, level) VALUES (2620, "building_government_administrationlevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 2620, 10.0, 1, 0.0);
INSERT INTO building(id, name, level) VALUES (2622, "building_glassworkslevel", 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2622, 90.0, 3, 47.81144996567055);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (21, 2622, 45.0, 3, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (31, 2622, 30.0, 3, 7.968574994278424);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (35, 2622, 75.0, 3, 19.92143748569606);
INSERT INTO building(id, name, level) VALUES (2623, "building_fishing_wharflevel", 4);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 2623, 20.0, 4, 7.673008026801673);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (8, 2623, 200.0, 4, 76.73008026801674);
INSERT INTO building(id, name, level) VALUES (2624, "building_rice_farmlevel", 6);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2624, 120.00000000000001, 6, 138.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (37, 2624, 36.0, 6, 41.4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (42, 2624, 54.00000000000001, 6, 62.1);
INSERT INTO building(id, name, level) VALUES (2625, "building_tobacco_plantationlevel", 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 2625, 66.32324509803921, 3, 67.64971);
INSERT INTO building(id, name, level) VALUES (2626, "building_barrackslevel", 10);
INSERT INTO building(id, name, level) VALUES (2627, "building_shipyardslevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (9, 2627, 20.0, 1, 51.44329085223821);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2627, 40.0, 1, 21.249533318075798);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (18, 2627, 35.0, 1, 26.796670826658165);
INSERT INTO building(id, name, level) VALUES (2628, "building_glassworkslevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2628, 30.0, 1, 15.937149988556847);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (21, 2628, 15.0, 1, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (31, 2628, 10.0, 1, 2.6561916647594748);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (35, 2628, 25.0, 1, 6.6404791618986865);
INSERT INTO building(id, name, level) VALUES (2629, "building_fishing_wharflevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 2629, 9.92279207920792, 2, 3.8068831636023215);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (8, 2629, 99.22800000000001, 2, 38.068862024173825);
INSERT INTO building(id, name, level) VALUES (2630, "building_rice_farmlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2630, 70.0, 2, 77.7);
INSERT INTO building(id, name, level) VALUES (2631, "building_tobacco_plantationlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 2631, 44.215495049504945, 2, 44.65765);
INSERT INTO building(id, name, level) VALUES (2632, "building_barrackslevel", 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (2, 2632, 3.0, 3, 0.0);
INSERT INTO building(id, name, level) VALUES (2633, "building_portlevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 2633, 5.0, 1, 1.9182520067004183);
INSERT INTO building(id, name, level) VALUES (2634, "building_government_administrationlevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 2634, 20.0, 2, 0.0);
INSERT INTO building(id, name, level) VALUES (2635, "building_glassworkslevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2635, 30.0, 1, 15.937149988556847);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (31, 2635, 30.0, 1, 15.937149988556849);
INSERT INTO building(id, name, level) VALUES (2636, "building_fishing_wharflevel", 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 2636, 14.92379411764706, 3, 5.725519602752074);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (8, 2636, 149.238, 3, 57.2552185951914);
INSERT INTO building(id, name, level) VALUES (2637, "building_rice_farmlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2637, 70.0, 2, 77.7);
INSERT INTO building(id, name, level) VALUES (2638, "building_tobacco_plantationlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 2638, 22.1175, 1, 22.1175);
INSERT INTO building(id, name, level) VALUES (2639, "building_barrackslevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (2, 2639, 2.0, 2, 0.0);
INSERT INTO building(id, name, level) VALUES (2640, "building_rice_farmlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2640, 70.0, 2, 77.7);
INSERT INTO building(id, name, level) VALUES (2641, "building_livestock_ranchlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 2641, 59.99999999999999, 2, 66.6);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (36, 2641, 9.999999999999998, 2, 11.1);
INSERT INTO building(id, name, level) VALUES (2642, "building_tobacco_plantationlevel", 3);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 2642, 66.32324509803921, 3, 67.64971);
INSERT INTO building(id, name, level) VALUES (2643, "building_barrackslevel", 5);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (2, 2643, 2.5, 5, 0.0);
INSERT INTO building(id, name, level) VALUES (2644, "building_government_administrationlevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 2644, 10.0, 1, 0.0);
INSERT INTO building(id, name, level) VALUES (2645, "building_glassworkslevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 2645, 60.0, 2, 31.874299977113694);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (21, 2645, 30.0, 2, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (31, 2645, 20.0, 2, 5.3123833295189495);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (35, 2645, 50.0, 2, 13.280958323797373);
INSERT INTO building(id, name, level) VALUES (2646, "building_iron_minelevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 2646, 5.0, 1, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (24, 2646, 20.0, 1, 0.0);
INSERT INTO building(id, name, level) VALUES (2647, "building_rice_farmlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 2647, 70.0, 2, 77.7);
INSERT INTO building(id, name, level) VALUES (2648, "building_livestock_ranchlevel", 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 2648, 15.0, 3, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 2648, 89.99999999999999, 3, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (36, 2648, 44.99999999999999, 3, 0.0);
INSERT INTO building(id, name, level) VALUES (2649, "building_barrackslevel", 10);
INSERT INTO building(id, name, level) VALUES (16780078, "building_cotton_plantationlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 16780078, 35.3724, 1, 44.2155);
INSERT INTO building(id, name, level) VALUES (50335084, "building_universitylevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 50335084, 5.0, 1, 0.0);
INSERT INTO building(id, name, level) VALUES (3582, "building_subsistence_farmslevel", 140);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3582, 354.12719999999996, 140, 389.53992);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3582, 59.0212, 140, 64.92332);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3582, 59.0212, 140, 64.92332);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3582, 59.0212, 140, 64.92332);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3582, 59.0212, 140, 64.92332);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3582, 59.0212, 140, 64.92332);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3582, 82.62967272727272, 140, 90.89264);
INSERT INTO building(id, name, level) VALUES (3583, "building_urban_centerlevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 3583, 10.0, 2, 5.3123833295189495);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3583, 50.0, 2, 26.561916647594746);
INSERT INTO building(id, name, level) VALUES (3584, "building_subsistence_farmslevel", 70);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3584, 165.42959999999997, 70, 181.97256);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3584, 27.571599999999997, 70, 30.32876);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3584, 27.571599999999997, 70, 30.32876);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3584, 27.571599999999997, 70, 30.32876);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3584, 27.571599999999997, 70, 30.32876);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3584, 27.571599999999997, 70, 30.32876);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3584, 38.600236363636355, 70, 42.46026);
INSERT INTO building(id, name, level) VALUES (3585, "building_subsistence_farmslevel", 72);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3585, 173.8648727272727, 72, 191.25136);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3585, 28.977472727272723, 72, 31.87522);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3585, 28.977472727272723, 72, 31.87522);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3585, 28.977472727272723, 72, 31.87522);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3585, 28.977472727272723, 72, 31.87522);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3585, 28.977472727272723, 72, 31.87522);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3585, 40.56846363636363, 72, 44.62531);
INSERT INTO building(id, name, level) VALUES (3586, "building_subsistence_farmslevel", 73);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3586, 170.2308818181818, 73, 187.25397);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3586, 28.37180909090909, 73, 31.20899);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3586, 28.37180909090909, 73, 31.20899);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3586, 28.37180909090909, 73, 31.20899);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3586, 28.37180909090909, 73, 31.20899);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3586, 28.37180909090909, 73, 31.20899);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3586, 39.72053636363636, 73, 43.69259);
INSERT INTO building(id, name, level) VALUES (3587, "building_subsistence_farmslevel", 129);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3587, 337.65362727272725, 129, 371.41899);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3587, 56.2756, 129, 61.90316);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3587, 56.2756, 129, 61.90316);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3587, 56.2756, 129, 61.90316);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3587, 56.2756, 129, 61.90316);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3587, 56.2756, 129, 61.90316);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3587, 78.78584545454544, 129, 86.66443);
INSERT INTO building(id, name, level) VALUES (3588, "building_urban_centerlevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 3588, 5.0, 1, 2.6561916647594748);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3588, 25.0, 1, 13.280958323797373);
INSERT INTO building(id, name, level) VALUES (33558319, "building_livestock_ranchlevel", 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 33558319, 30.0, 3, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 33558319, 89.99999999999999, 3, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (36, 33558319, 74.99999999999999, 3, 0.0);
INSERT INTO building(id, name, level) VALUES (4393, "building_conscription_centerlevel", 20);
INSERT INTO building(id, name, level) VALUES (4394, "building_conscription_centerlevel", 9);
INSERT INTO building(id, name, level) VALUES (4395, "building_conscription_centerlevel", 9);
INSERT INTO building(id, name, level) VALUES (4396, "building_conscription_centerlevel", 9);
INSERT INTO building(id, name, level) VALUES (4397, "building_conscription_centerlevel", 17);
INSERT INTO building(id, name, level) VALUES (4656, "building_construction_sectorlevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (9, 4656, 20.0, 1, 51.44329085223821);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 4656, 40.0, 1, 21.249533318075798);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (24, 4656, 50.0, 1, 0.0);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 4656, 10.0, 1, 0.0);
INSERT INTO building(id, name, level) VALUES (16782078, "building_portlevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 16782078, 10.0, 2, 3.8365040134008366);
INSERT INTO building(id, name, level) VALUES (5027, "building_government_administrationlevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 5027, 10.0, 1, 0.0);
INSERT INTO building(id, name, level) VALUES (16782289, "building_portlevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 16782289, 5.0, 1, 1.9182520067004183);
INSERT INTO building(id, name, level) VALUES (16782341, "building_fishing_wharflevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 16782341, 5.0, 1, 1.9182520067004183);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (8, 16782341, 50.0, 1, 19.182520067004184);
INSERT INTO building(id, name, level) VALUES (5224, "building_urban_centerlevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 5224, 5.0, 1, 2.6561916647594748);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 5224, 25.0, 1, 13.280958323797373);
INSERT INTO building(id, name, level) VALUES (16782674, "building_cotton_plantationlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 16782674, 35.38, 1, 44.225);
INSERT INTO building(id, name, level) VALUES (16782733, "building_livestock_ranchlevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (33, 16782733, 19.999999999999996, 2, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 16782733, 59.99999999999999, 2, 0.0);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (36, 16782733, 49.99999999999999, 2, 0.0);
INSERT INTO building(id, name, level) VALUES (16782837, "building_universitylevel", 4);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 16782837, 20.0, 4, 0.0);
INSERT INTO building(id, name, level) VALUES (16782842, "building_universitylevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (14, 16782842, 5.0, 1, 0.0);
INSERT INTO building(id, name, level) VALUES (5727, "building_urban_centerlevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 5727, 0.508, 1, 0.26986907313956265);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 5727, 2.54, 1, 1.3493453656978132);
INSERT INTO building(id, name, level) VALUES (16783102, "building_cotton_plantationlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 16783102, 35.3724, 1, 44.2155);
INSERT INTO building(id, name, level) VALUES (16783103, "building_cotton_plantationlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 16783103, 35.4196, 1, 44.2745);
INSERT INTO building(id, name, level) VALUES (6036, "building_tobacco_plantationlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 6036, 22.1175, 1, 22.1175);
INSERT INTO building(id, name, level) VALUES (6534, "building_subsistence_rice_paddieslevel", 140);
INSERT INTO building(id, name, level) VALUES (6535, "building_subsistence_rice_paddieslevel", 70);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 6535, 0.5236, 70, 0.57596);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 6535, 0.07139999999999999, 70, 0.07854);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 6535, 0.07139999999999999, 70, 0.07854);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 6535, 0.09519999999999999, 70, 0.10472);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 6535, 0.09519999999999999, 70, 0.10472);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 6535, 0.09519999999999999, 70, 0.10472);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 6535, 0.14279999999999998, 70, 0.15708);
INSERT INTO building(id, name, level) VALUES (6536, "building_subsistence_rice_paddieslevel", 71);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 6536, 0.9762454545454545, 71, 1.07387);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 6536, 0.1331181818181818, 71, 0.14643);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 6536, 0.1331181818181818, 71, 0.14643);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 6536, 0.1775, 71, 0.19525);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 6536, 0.1775, 71, 0.19525);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 6536, 0.1775, 71, 0.19525);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 6536, 0.26624545454545456, 71, 0.29287);
INSERT INTO building(id, name, level) VALUES (6537, "building_subsistence_rice_paddieslevel", 73);
INSERT INTO building(id, name, level) VALUES (6538, "building_subsistence_rice_paddieslevel", 129);
