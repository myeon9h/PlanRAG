
  
CREATE TABLE goods(    goods_name    VARCHAR(30),    code    INT,    base_price FLOAT,    current_price FLOAT,    pop_demand FLOAT, PRIMARY KEY (code));

CREATE TABLE building(    id INT,    name VARCHAR(80),    level INT, PRIMARY KEY (id));

CREATE TABLE supply(    goods_id INT,    building_id INT,    max_supply FLOAT,    current_output FLOAT,    level INT, PRIMARY KEY (goods_id, building_id));

CREATE TABLE demand(    goods_id INT,    building_id INT,    max_demand FLOAT,    current_input FLOAT,    level INT,   PRIMARY KEY (goods_id, building_id));
    
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("ammunition", 0, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("small_arms", 1, 60, 105.0, 19.624740600295308);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("artillery", 2, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tanks", 3, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("aeroplanes", 4, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("manowars", 5, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("ironclads", 6, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("grain", 7, 20, 35.0, 7602.935267063429);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fish", 8, 20, 35.0, 120.83040706742239);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fabric", 9, 20, 35.0, 252.54271142857166);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("wood", 10, 20, 35.0, 1515.2562685714313);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("groceries", 11, 30, 52.5, 655.8951327577911);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("clothes", 12, 30, 52.5, 2020.2177410898205);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("furniture", 13, 30, 52.5, 1741.2639881190726);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("paper", 14, 30, 52.5, 80.60261191018024);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("services", 15, 30, 52.5, 1010.6715529709107);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("transportation", 16, 30, 52.5, 524.4461000000003);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("electricity", 17, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("clippers", 18, 60, 105.0, 10.864354498531332);
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
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("glass", 31, 40, 70.0, 30.073240742834862);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fertilizer", 32, 30, 30, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tools", 33, 40, 40, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("explosives", 34, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("porcelain", 35, 70, 122.5, 126.2441835027407);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("meat", 36, 30, 52.5, 322.46913446768195);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fruit", 37, 30, 52.5, 522.8859218252315);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("liquor", 38, 30, 52.5, 2945.9667383268165);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("wine", 39, 50, 87.5, 295.10612196873643);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tea", 40, 50, 87.5, 226.18964082665718);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("coffee", 41, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("sugar", 42, 30, 52.5, 84.73872256484262);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("tobacco", 43, 40, 70.0, 64.98936250489217);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("opium", 44, 50, 50, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("automobiles", 45, 100, 100, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("telephones", 46, 70, 70, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("radios", 47, 80, 80, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("luxury_clothes", 48, 60, 105.0, 641.9692053782594);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("luxury_furniture", 49, 60, 105.0, 672.3002805352085);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("gold", 50, 100, 100, 0);
INSERT INTO goods(goods_name,code,base_price, current_price, pop_demand) VALUES ("fine_art", 51, 200, 350.0, 4.253219692321545);
