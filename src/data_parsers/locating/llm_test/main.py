from prompt import *
import json
import os



# LLM 을 이용해 EU4-locating 을 체크하는 code 입니다.

def test_llm(indices, json_file_dir="./dataset/questions/generated_examples_tradenode/example_anony.json", zeroshot=True, anony = False,strategy_mode = False):
    
    
    
    from langchain.llms import OpenAI, OpenLLM
    from langchain.chat_models import ChatOpenAI
    from langchain.schema import AIMessage, HumanMessage, SystemMessage
    from langchain.schema import get_buffer_string
    
    server_url = "http://localhost:3000"
    # llm = OpenLLM(server_url = server_url)    
    llm = ChatOpenAI(temperature=0.7)
    # llm = OpenAI(temperature=0)



    with open(json_file_dir) as file:
        json_obj = json.load(file)


    prompt_dict = {}
    situation_prompt = situation()
    strategy_prompt = strategy()

    for idx in indices:
        problem = json_obj[idx]
        question_prompt = question(problem["country"], problem["homenode"], problem["examples"], year=problem["year"], anony = anony)
        db_prompt = db_gen(problem["homenode"], problem["examples"], problem["year"], anony=anony)
        
        if zeroshot == False:
            prompt = situation_prompt+IOwR()+db_prompt+question_prompt
        else:
            
            prompt = situation_prompt+db_prompt+question_prompt
            
        if strategy_mode:
            prompt = prompt+strategy_prompt

        prompt_dict[idx]=prompt


    for idx in indices:
        print("problem #{}".format(idx))
        prompt = prompt_dict[idx]
        if anony:
            print(prompt, anonymize(json_obj[idx]["answer"], mode="N"))
        else:
            print(prompt, json_obj[idx]["answer"])
        print("************************")
    exit()
    
    for idx in indices:
        prompt = prompt_dict[idx]
        messages = [
            HumanMessage(content=prompt)
        ]
        # answer = llm(prompt)
        answer = llm(messages)
        if anony:
            gold_answer = anonymize(json_obj[idx]["answer"], mode="N")
        else:
            gold_answer = json_obj[idx]["answer"]
            

        print("""
problem number #{}

{}

Gold answer:
{}
        """.format(idx, get_buffer_string([answer]), gold_answer))

    
    file.close()



if __name__ == "__main__":
    test_llm([i for i in range(21)],zeroshot=True, anony=False, strategy_mode=False)
    # test_llm([i for i in range(1)],mode="zero-shot", anony=True, strategy_mode=False)


# data storage
# IOwR means inputOutput with Reason.
