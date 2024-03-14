

if __name__ == "__main__":


    from langchain.llms import Ollama
    from langchain.llms.huggingface_pipeline import HuggingFacePipeline

    llm =  HuggingFacePipeline.from_model_id(
    model_id="meta-llama/Llama-2-70b-hf",
    task="text-generation",
    pipeline_kwargs={"temperature": 0.01, "max_length": 1000},
    device=0
)
    from langchain.prompts import PromptTemplate

    template = """Question: {question}

    Answer: Let's think step by step."""
    prompt = PromptTemplate.from_template(template)

    chain = prompt | llm

    question = "What is electroencephalography?"

    print(chain.invoke({"question": question}))