
CREATE TABLE general
(
    name VARCHAR(20),
    current_price FLOAT,
    base_price FLOAT,
    changes_as_percent VARCHAR(10),
    CONSTRAINT name PRIMARY KEY (name)
);
    INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Ammunition", 59, 50, "18%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Clippers", 41, 60, "-31%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Coal", 41, 30, "38%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Fertilizer", 45, 30, "52%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Fine Arts", 350, 200, "75%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Lead", 32, 40, "-19%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Oil", 10, 40, "-75%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Paper", 39, 30, "32%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Sulfur", 87, 50, "75%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Wood", 13, 20, "-31%");
