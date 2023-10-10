import json, os

def example_to_anony(file_dir = "./output/anonyTable.json", example_file_dir = "./dataset/questions/generated_examples_tradenode/example.json", save_file_dir = "./dataset/questions/generated_examples_tradenode/example_anony.json"):
    
    with open(file_dir, "r") as file:
        anonyTable = json.load(file)
    
    # print(anonyTable["safi"])
    
    file.close()
    
    with open(example_file_dir, "r") as file:
        exampleTable = json.load(file)
        
    file.close()
    
    new_exampleTable = []
    for example in exampleTable:
        example["answer"] = anonyTable[example["answer"]]
        example["homenode"] = anonyTable[example["homenode"]]
        temp = []
        for e in example["examples"]:
            temp.append(anonyTable[e])
        example["examples"] = temp

        new_exampleTable.append(example)
    
    with open(save_file_dir, "w") as file:
        json.dump(new_exampleTable, file, indent=4)
    file.close()
    
    
    return

if __name__ == "__main__":
    example_to_anony()
    
    