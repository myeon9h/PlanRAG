from typing import List, Optional, Tuple, Dict

from neo4j import GraphDatabase, graph
import pandas as pd
from logger import logger


class Neo4jDatabase:
    def __init__(self, host: str = "neo4j://localhost:7687",
                 user: str = "neo4j",
                 password: str = "pleaseletmein",
                 database: str = "neo4j"):
        """Initialize the movie database"""

        self.driver = GraphDatabase.driver(host, auth=(user, password))
        self.database = database

    def query(
        self,
        cypher_query: str,
        params: Optional[Dict] = {}
    ) -> List[Dict[str, str]]:
        logger.debug(cypher_query)
        # debug gpt-3.5-turbo ``` issue
        cypher_query = "\n".join([q for q in cypher_query.split("\n") if "```" not in q])

        with self.driver.session(database=self.database) as session:
            try:
                result = session.run(cypher_query, params)
            except Exception as error:
                return ("An exception occured: {}".format(error))
            # Limit to at most 50 results
            result = pd.DataFrame(result)
            
            # print(type(result[0][0]), isinstance(result[0][0], graph.Node))
            
            node_to_string = (lambda a: a if not isinstance(a,graph.Node) else "{{label: {0}, {1}}}".format([i for i in a.labels], ["{}: {}".format(j,a[j]) for j in a]))
            
            # print(node_to_string(result[0][0]))
            
            for i in result:
                result[i] = result[i].apply(node_to_string)

            return """\n{}""".format(result)

#             return """
# {}  
# {}""".format(cypher_query,result)

    def query_with_specific_database(
        self,
        cypher_query: str,
        database: str,
        params: Optional[Dict] = {}
    ) -> List[Dict[str, str]]:
        logger.debug(cypher_query)
        with self.driver.session(database=database) as session:
            try:
                result = session.run(cypher_query, params)
            except Exception as error:
                return ("An exception occured: {}".format(error))
            # Limit to at most 50 results
            result = pd.DataFrame(result)
            
            # print(type(result[0][0]), isinstance(result[0][0], graph.Node))
            
            node_to_string = (lambda a: a if not isinstance(a,graph.Node) else "{{label: {0}, {1}}}".format([i for i in a.labels], ["{}: {}".format(j,a[j]) for j in a]))
            
            # print(node_to_string(result[0][0]))
            
            for i in result:
                result[i] = result[i].apply(node_to_string)
            
            return """
{}  
{}""".format(cypher_query,result)


if __name__ == "__main__":
    database = Neo4jDatabase(host="bolt://100.27.33.83:7687",
                             user="neo4j", password="room-loans-transmissions")

    a = database.query("""
    MATCH (n) RETURN {count: count(*)} AS count
    """)

    print(a)