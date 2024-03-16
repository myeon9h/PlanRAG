from tradenode import Node
import networkx as nx
import matplotlib
import matplotlib.pyplot as plt


def node_visualizer(nodes_dict, file_name):
    G = nx.DiGraph()

    nodes_string = list(nodes_dict.keys())
    edges_string = list()
    
    for source in nodes_dict.values():
        edges_string = edges_string + [(source.name, dest_name) for dest_name in source.out_going]
    
    G.add_nodes_from(nodes_string)
    G.add_edges_from(edges_string)

    plt.figure(figsize=(20,20))
    

    layout = nx.layout.spring_layout(G)

    nx.draw_networkx(G, layout, with_labels=True, node_color = 'yellow', font_weight = "bold")

    matplotlib.use("Agg")
    plt.savefig(file_name)

