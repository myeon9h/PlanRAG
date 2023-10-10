RDB_INFO = """
CREATE TABLE general(
    name    VARCHAR(30),
    current FLOAT,
    local_value FLOAT,
    outgoing FLOAT,
    value_added_outgoing FLOAT,
    retention_ FLOAT,
    CONSTRAINT name PRIMARY KEY (name)
);

CREATE TABLE trading(
    node_name       VARCHAR(30),
    country_code    VARCHAR(5),
    val FLOAT,
    CONSTRAINT country_code PRIMARY KEY (node_name, country_code)
);
"""

RDB_INFO_NORM = """
CREATE TABLE general(
    name    VARCHAR(30),
    current FLOAT,
    local_value FLOAT,
    outgoing FLOAT,
    value_added_outgoing FLOAT,
    retention_ FLOAT,
    CONSTRAINT name PRIMARY KEY (name)
);

CREATE TABLE N_alpha, N_alpha_beta, N_alpha_charlie, N_alpha_delta, N_alpha_echo, N_alpha_foxtrot, N_alpha_golf, N_alpha_hotel, N_beta, N_beta_beta, N_beta_charlie, N_beta_delta, N_beta_echo, N_beta_foxtrot, N_beta_golf, N_beta_hotel, N_charlie, N_charlie_beta, N_charlie_charlie, N_charlie_delta, N_charlie_echo, N_charlie_foxtrot, N_charlie_golf, N_charlie_hotel, N_delta, N_delta_beta, N_delta_charlie, N_delta_delta, N_delta_echo, N_delta_foxtrot, N_delta_golf, N_delta_hotel, N_echo, N_echo_beta, N_echo_charlie, N_echo_delta, N_echo_echo, N_echo_foxtrot, N_echo_golf, N_echo_hotel, N_foxtrot, N_foxtrot_beta, N_foxtrot_charlie, N_foxtrot_delta, N_foxtrot_echo, N_foxtrot_foxtrot, N_foxtrot_golf, N_foxtrot_hotel, N_golf, N_golf_beta, N_golf_charlie, N_golf_delta, N_golf_echo, N_golf_foxtrot, N_golf_golf, N_golf_hotel, N_hotel, N_hotel_beta, N_hotel_charlie, N_hotel_delta, N_hotel_echo, N_hotel_foxtrot, N_hotel_golf, N_hotel_hotel, N_india, N_india_beta, N_india_charlie, N_india_delta, N_india_echo, N_india_foxtrot, N_india_golf, N_india_hotel, N_juliet, N_juliet_beta, N_juliet_charlie, N_juliet_delta, N_juliet_echo, N_juliet_foxtrot, N_juliet_golf, N_juliet_hotel (
    country_code    VARCHAR(5),
    val FLOAT,
    CONSTRAINT country_code PRIMARY KEY (country_code)
);
"""

GDB_INFO = """
(a:Trade_node{{name}})-[:UPSTREAM]->(b:Trade_node{{name}});
(b:Trade_node{{name}})-[:DOWNSTREAM]->(a:Trade_node{{name}});
"""

# With examples. currently wrong example
RDB_INFO_WITH_EX = """
CREATE TABLE general(
    name    VARCHAR(30),
    current FLOAT,
    local_value FLOAT,
    outgoing FLOAT,
    value_added_outgoing FLOAT,
    retention_ FLOAT,
    CONSTRAINT name PRIMARY KEY (name)
Here are 3 examples of following the schema above:
+---------------------+---------+-------------+----------+----------------------+------------+
| name                | current | local_value | outgoing | value_added_outgoing | retention_ |
+---------------------+---------+-------------+----------+----------------------+------------+
| N_alpha             |   1.217 |       1.637 |     0.42 |                 0.42 |      0.743 |
| N_alpha_beta        |   2.473 |       4.268 |    2.603 |                2.603 |      0.487 |
| N_alpha_charlie     |   5.339 |       6.764 |    4.314 |                4.314 |      0.553 |
+---------------------+---------+-------------+----------+----------------------+------------+

CREATE TABLE trading(
    node_name       VARCHAR(30),
    country_code    VARCHAR(5),
    val FLOAT,
    CONSTRAINT country_code PRIMARY KEY (node_name, country_code)
);
Here are 3 examples of following the schema above:
+-----------+--------------+--------+
| node_name | country_code | val    |
+-----------+--------------+--------+
| N_alpha   | BNY          | 15.194 |
| N_alpha   | BSG          | 12.269 |
| N_alpha   | BUG          | 26.164 |
+-----------+--------------+--------+     
"""

GDB_INFO_WITH_EX = """
(:Trade_node{{name}})-[:UPSTREAM]->(:Trade_node{{name}});
(:Trade_node{{name}})-[:DOWNSTREAM]->(:Trade_node{{name}});
Here are 3 examples of following the schema above:
(:Trade_node{{name:"N_alpha"}}-[:DOWNSTREAM]->(:Trade_node{{name:"N_beta"}}))
(:Trade_node{{name:"N_beta"}}-[:UPSTREAM]->(:Trade_node{{name:"N_alpha"}}))
(:Trade_node{{name:"N_alpha_echo"}}-[:UPSTREAM]->(:Trade_node{{name:"N_alpha"}}))
"""