
CREATE TABLE general
(
    name VARCHAR(20),
    current_price FLOAT,
    base_price FLOAT,
    changes_as_percent VARCHAR(10),
    CONSTRAINT name PRIMARY KEY (name)
);
INSERT INTO general(name, current_price, changes_as_percent) VALUES("Clippers", 105, "75%");
INSERT INTO general(name, current_price, changes_as_percent) VALUES("Coal", 25, "-13%");
INSERT INTO general(name, current_price, changes_as_percent) VALUES("Fish", 20, "3%");
INSERT INTO general(name, current_price, changes_as_percent) VALUES("Furniture", 31, "6%");
INSERT INTO general(name, current_price, changes_as_percent) VALUES("Grain", 21, "9%");
INSERT INTO general(name, current_price, changes_as_percent) VALUES("Groceries", 44, "49%");
INSERT INTO general(name, current_price, changes_as_percent) VALUES("Iron", 49, "23%");
INSERT INTO general(name, current_price, changes_as_percent) VALUES("Steel", 62, "25%");
INSERT INTO general(name, current_price, changes_as_percent) VALUES("Sulfur", 26, "-47%");
INSERT INTO general(name, current_price, changes_as_percent) VALUES("Wood", 16, "-17%");