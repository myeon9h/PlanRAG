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


def prompts(
        llm: BaseLanguageModel, tools: Sequence[BaseTool], **kwargs: Any
    ) -> LLMChain:
        # agent = TaskManagerAgent.from_llm_and_tools(llm, tools)

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

    return retrieving_prompt, answering_prompt



    