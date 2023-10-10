
CREATE TABLE general
(
    name VARCHAR(20),
    current_price FLOAT,
    base_price FLOAT,
    changes_as_percent VARCHAR(10),
    CONSTRAINT name PRIMARY KEY (name)
);
    INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Ammunition", 87, 50, "75%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Clothes", 24, 30, "-18%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Explosives", 87, 50, "75%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Fabric", 20, 20, "0%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Fine Arts", 350, 200, "75%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Liquor", 26, 30, "-11%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Paper", 38, 30, "27%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Sulfur", 19, 50, "-61%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Tools", 45, 40, "12%");
