
CREATE TABLE general
(
    name VARCHAR(20),
    current_price FLOAT,
    base_price FLOAT,
    changes_as_percent VARCHAR(10),
    CONSTRAINT name PRIMARY KEY (name)
);
    INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Clippers", 31, 60, "-47%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Coal", 39, 30, "32%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Engines", 105, 60, "75%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Fine Arts", 350, 200, "75%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Oil", 19, 40, "-50%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Paper", 38, 30, "28%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Steel", 44, 50, "-10%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Sulfur", 49, 50, "-1%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Transportation", 49, 30, "66%");
INSERT INTO general(name, current_price, base_price, changes_as_percent) VALUES("Wood", 19, 20, "0%");
