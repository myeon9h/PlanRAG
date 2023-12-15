import re
from typing import Any, Sequence


from langchain.base_language import BaseLanguageModel
from langchain.chains.llm import LLMChain
from langchain.prompts.chat import (
    ChatPromptTemplate,
    HumanMessagePromptTemplate,
    SystemMessagePromptTemplate,
)

from langchain.tools import BaseTool

from techniques.SingleRAG.prompt import (
    FORMAT_INSTRUCTIONS, PREFIX, SUFFIX, HUMAN_MESSAGE_TEMPLATE, SUFFIX_AFTER_RETRIEVE, FORMAT_INSTRUCTIONS_AFTER_RETRIEVE, PREFIX_AFTER_RETRIEVE
)

class TaskManagerSingleRAG:
    def __init__(self, db_engine):
        self.db_engine = db_engine

    def from_llm_and_tools(self, llm: BaseLanguageModel, tools: Sequence[BaseTool], **kwargs: Any):
        human_message_template = HUMAN_MESSAGE_TEMPLATE

        answering_format_instructions = FORMAT_INSTRUCTIONS_AFTER_RETRIEVE
        answering_prefix = PREFIX_AFTER_RETRIEVE
        answering_suffix = SUFFIX_AFTER_RETRIEVE

        retrieving_format_instructions = FORMAT_INSTRUCTIONS
        retrieving_prefix = PREFIX
        retrieving_suffix = SUFFIX
        
        tool_strings = []
        for tool in tools:
            args_schema = re.sub("}", "}}}}", re.sub("{", "{{{{", str(tool.args)))
            tool_strings.append(f"{tool.name}: {tool.description}, args: {args_schema}")
        formatted_tools = "\n".join(tool_strings)
        retrieving_template = "\n\n".join([retrieving_prefix, formatted_tools, retrieving_format_instructions, retrieving_suffix])
        answering_template = "\n\n".join([answering_prefix, answering_format_instructions, answering_suffix])

        retrieving_messages = [
            SystemMessagePromptTemplate.from_template(retrieving_template),
            HumanMessagePromptTemplate.from_template(human_message_template),
        ]

        answering_messages = [
            SystemMessagePromptTemplate.from_template(answering_template),
            HumanMessagePromptTemplate.from_template(human_message_template),
        ]


        retrieving_prompt =  ChatPromptTemplate(input_variables=["input"], messages=retrieving_messages, output_key = "query")

        answering_prompt = ChatPromptTemplate(input_variables=["input"], messages=answering_messages, output_key = "output")
        
        self.retrieving_chain = LLMChain(llm=llm, prompt=retrieving_prompt, verbose= True)
        self.answering_chain = LLMChain(llm=llm, prompt=answering_prompt, verbose = True)

        return self

    def run(self, question):
        query_raw = self.retrieving_chain.run(question)
        query = query_raw.split("Action input:")[1]
        if "Observation" in query:
            query = query.split("Observation")[0]
        retrieved_data = self.db_engine.query(query)
        chain_input = f"""
{question}
Retrieving query:{query}
Retrieved data: {retrieved_data}        
"""
        final_decision = self.answering_chain.run(chain_input)
        print(final_decision)