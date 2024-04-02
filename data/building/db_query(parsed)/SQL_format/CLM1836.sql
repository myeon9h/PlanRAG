
  
CREATE TABLE goods(    goods_name    VARCHAR(30),    code    INT,    base_price FLOAT,    current_price FLOAT,    pop_demand FLOAT, PRIMARY KEY (code));

CREATE TABLE building(    id INT,    name VARCHAR(80),    level INT, PRIMARY KEY (id));

CREATE TABLE supply(    goods_id INT,    building_id INT,    max_supply FLOAT,    current_output FLOAT,    level INT, PRIMARY KEY (goods_id, building_id));

CREATE TABLE demand(    goods_id INT,    building_id INT,    max_demand FLOAT,    current_input FLOAT,    level INT,   PRIMARY KEY (goods_id, building_id));
    
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("ammunition", 0, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("small_arms", 1, 60, 105.0, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("artillery", 2, 70, 122.5, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tanks", 3, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("aeroplanes", 4, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("manowars", 5, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("ironclads", 6, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("grain", 7, 20, 21.861486735238223, 313.565158932364);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fish", 8, 20, 21.860834514862386, 28.54062538630645);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fabric", 9, 20, 17.176975927525675, 62.65769624190795);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("wood", 10, 20, 25.68938667923964, 11.86945625809209);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("groceries", 11, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("clothes", 12, 30, 29.629541451580135, 66.35033533035329);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("furniture", 13, 30, 25.371893481158594, 75.77119669793954);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("paper", 14, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("services", 15, 30, 16.179967449290437, 20.63766333333334);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("transportation", 16, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("electricity", 17, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("clippers", 18, 60, 105.0, 0);
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
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tools", 33, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("explosives", 34, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("porcelain", 35, 70, 122.5, 3.1028621428571435);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("meat", 36, 30, 25.92836453199125, 4.078811349747396);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fruit", 37, 30, 25.930932354437537, 24.47627816669305);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("liquor", 38, 30, 28.777859962834842, 30.359354620065904);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("wine", 39, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tea", 40, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("coffee", 41, 50, 26.175244230232188, 21.938154999999995);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("sugar", 42, 30, 10.24591511058603, 11.012657305911894);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tobacco", 43, 40, 31.096885149991223, 70.74207528495057);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("opium", 44, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("automobiles", 45, 100, 100, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("telephones", 46, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("radios", 47, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("luxury_clothes", 48, 60, 105.0, 28.960046666666667);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("luxury_furniture", 49, 60, 105.0, 3.6200058333333334);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("gold", 50, 100, 100, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fine_art", 51, 200, 200, 0);
INSERT INTO building(id, name, level) VALUES (1711, "building_coffee_plantationlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (41, 1711, 19.92, 19.92, 1);
INSERT INTO building(id, name, level) VALUES (1712, "building_banana_plantationlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (37, 1712, 29.88, 29.88, 1);
INSERT INTO building(id, name, level) VALUES (1777, "building_government_administrationlevel", 2);
INSERT INTO building(id, name, level) VALUES (1778, "building_fishing_wharflevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (8, 1778, 25.0, 25.0, 1);
INSERT INTO building(id, name, level) VALUES (1779, "building_tobacco_plantationlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 1779, 49.800000000000004, 50.298, 2);
INSERT INTO building(id, name, level) VALUES (1780, "building_sugar_plantationlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (42, 1780, 59.76, 60.3576, 2);
INSERT INTO building(id, name, level) VALUES (1781, "building_barrackslevel", 5);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (1, 1781, 5.0, 0.0, 5);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (2, 1781, 2.5, 0.0, 5);
INSERT INTO building(id, name, level) VALUES (1782, "building_portlevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (18, 1782, 5.0, 0.0, 1);
INSERT INTO building(id, name, level) VALUES (1783, "building_government_administrationlevel", 1);
INSERT INTO building(id, name, level) VALUES (1784, "building_rice_farmlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 1784, 34.86, 34.86, 1);
INSERT INTO building(id, name, level) VALUES (1785, "building_livestock_ranchlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 1785, 29.88, 29.88, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (36, 1785, 4.98, 4.98, 1);
INSERT INTO building(id, name, level) VALUES (1786, "building_barrackslevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (1, 1786, 1.0, 0.0, 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (2, 1786, 0.5, 0.0, 1);
INSERT INTO building(id, name, level) VALUES (1787, "building_government_administrationlevel", 2);
INSERT INTO building(id, name, level) VALUES (1788, "building_textile_millslevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (9, 1788, 40.0, 49.27331741238962, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 1788, 45.0, 45.0, 1);
INSERT INTO building(id, name, level) VALUES (1789, "building_sugar_plantationlevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (42, 1789, 29.88, 29.88, 1);
INSERT INTO building(id, name, level) VALUES (1790, "building_cotton_plantationlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 1790, 79.67999999999999, 100.3968, 2);
INSERT INTO building(id, name, level) VALUES (1791, "building_rice_farmlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 1791, 69.72, 70.4172, 2);
INSERT INTO building(id, name, level) VALUES (1792, "building_barrackslevel", 6);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (1, 1792, 6.0, 0.0, 6);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (2, 1792, 3.0, 0.0, 6);
INSERT INTO building(id, name, level) VALUES (1793, "building_furniture_manufacturieslevel", 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (9, 1793, 20.0, 24.63665870619481, 2);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 1793, 60.0, 37.24245328304145, 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 1793, 90.0, 72.93183996228109, 2);
INSERT INTO building(id, name, level) VALUES (1794, "building_logging_camplevel", 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 1794, 30.0, 30.0, 1);
INSERT INTO building(id, name, level) VALUES (1795, "building_tobacco_plantationlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (43, 1795, 49.800000000000004, 50.298, 2);
INSERT INTO building(id, name, level) VALUES (1796, "building_coffee_plantationlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (41, 1796, 39.839999999999996, 40.2384, 2);
INSERT INTO building(id, name, level) VALUES (1797, "building_maize_farmlevel", 2);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 1797, 59.76, 60.3576, 2);
INSERT INTO building(id, name, level) VALUES (1798, "building_barrackslevel", 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (1, 1798, 3.0, 0.0, 3);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (2, 1798, 1.5, 0.0, 3);
INSERT INTO building(id, name, level) VALUES (3000, "building_subsistence_farmslevel", 18);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3000, 10.9782, 10.9782, 18);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3000, 2.19564, 2.19564, 18);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3000, 2.19564, 2.19564, 18);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3000, 2.19564, 2.19564, 18);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3000, 2.19564, 2.19564, 18);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3000, 2.19564, 2.19564, 18);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3000, 3.07389, 3.07389, 18);
INSERT INTO building(id, name, level) VALUES (3136, "building_subsistence_farmslevel", 116);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3136, 39.9388, 39.9388, 116);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3136, 7.98776, 7.98776, 116);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3136, 7.98776, 7.98776, 116);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3136, 7.98776, 7.98776, 116);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3136, 7.98776, 7.98776, 116);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3136, 7.98776, 7.98776, 116);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3136, 11.18286, 11.18286, 116);
INSERT INTO building(id, name, level) VALUES (3137, "building_subsistence_farmslevel", 58);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3137, 8.0156, 8.0156, 58);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3137, 1.60312, 1.60312, 58);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3137, 1.60312, 1.60312, 58);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3137, 1.60312, 1.60312, 58);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3137, 1.60312, 1.60312, 58);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3137, 1.60312, 1.60312, 58);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3137, 2.24436, 2.24436, 58);
INSERT INTO building(id, name, level) VALUES (3138, "building_subsistence_rice_paddieslevel", 45);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3138, 29.59335, 29.59335, 45);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3138, 4.93222, 4.93222, 45);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3138, 4.93222, 4.93222, 45);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3138, 6.5763, 6.5763, 45);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3138, 6.5763, 6.5763, 45);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3138, 6.5763, 6.5763, 45);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3138, 9.86445, 9.86445, 45);
INSERT INTO building(id, name, level) VALUES (3139, "building_urban_centerlevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 3139, 5.0, 3.1035377735867873, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3139, 25.0, 15.517688867933938, 1);
INSERT INTO building(id, name, level) VALUES (3140, "building_subsistence_farmslevel", 74);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3140, 18.97175, 18.97175, 74);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3140, 3.79435, 3.79435, 74);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3140, 3.79435, 3.79435, 74);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3140, 3.79435, 3.79435, 74);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3140, 3.79435, 3.79435, 74);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3140, 3.79435, 3.79435, 74);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3140, 5.31209, 5.31209, 74);
INSERT INTO building(id, name, level) VALUES (3150, "building_subsistence_farmslevel", 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (7, 3150, 1.5195, 1.5195, 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (9, 3150, 0.3039, 0.3039, 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (10, 3150, 0.3039, 0.3039, 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (12, 3150, 0.3039, 0.3039, 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (13, 3150, 0.3039, 0.3039, 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3150, 0.3039, 0.3039, 4);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (38, 3150, 0.42546, 0.42546, 4);
INSERT INTO building(id, name, level) VALUES (3991, "building_trade_centerlevel", 17);
INSERT INTO building(id, name, level) VALUES (3992, "building_urban_centerlevel", 1);
INSERT INTO demand(goods_id, building_id, max_demand, current_input, level) VALUES (10, 3992, 5.0, 3.1035377735867873, 1);
INSERT INTO supply(goods_id, building_id, max_supply, current_output, level) VALUES (15, 3992, 25.0, 15.517688867933938, 1);
INSERT INTO building(id, name, level) VALUES (4174, "building_conscription_centerlevel", 2);
INSERT INTO building(id, name, level) VALUES (4175, "building_conscription_centerlevel", 1);