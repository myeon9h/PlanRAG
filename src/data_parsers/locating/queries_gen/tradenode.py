from src.data_parsers.locating.queries_gen.anonymize import *

class Node:
    def __init__(self, name):
        global nodeCount
        self.name = name
        self.anony_name = anonymize(name, mode="N")
        # out_going node 를 string 으로 나타낸 것이다.
        self.out_going = list()
        self.members = set()

        # node 의 RDB 를 위한 요소
        self.node_values = dict()
        self.node_countries = dict()
        self.inland = False

    def __repr__(self) -> str:

        repr_string = f"""
        
        node name: {self.name}
        node outgoing: {self.out_going}
        node_values: {self.node_values}
        node_countires: {self.node_countries}
        anony node name: {self.anony_name}
        inland {self.inland}
        
        """
        return repr_string