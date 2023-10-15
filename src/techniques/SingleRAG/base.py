import re
from typing import Any, Dict, List, Optional, Sequence, Tuple

from pydantic import Field

from langchain.agents.agent import Agent, AgentExecutor, AgentOutputParser
from langchain.base_language import BaseLanguageModel
from langchain.callbacks.base import BaseCallbackManager
from langchain.chains.llm import LLMChain
from langchain.chains import SequentialChain
from langchain.chains.base import Chain
from langchain.prompts.base import BasePromptTemplate
from langchain.prompts.chat import (
    ChatPromptTemplate,
    HumanMessagePromptTemplate,
    SystemMessagePromptTemplate,
)
from langchain.schema import AgentAction
from langchain.tools import BaseTool

from techniques.SingleRAG.prompt import (
    FORMAT_INSTRUCTIONS, PREFIX, SUFFIX, HUMAN_MESSAGE_TEMPLATE, SUFFIX_AFTER_RETRIEVE, FORMAT_INSTRUCTIONS_AFTER_RETRIEVE, PREFIX_AFTER_RETRIEVE
)
from techniques.SingleRAG.output_parser import TaskManagerOutputParserWithRetries

singlerag_retrieve = False

class TaskManagerAgent(Agent):
    output_parser: AgentOutputParser = Field(
        default_factory=TaskManagerOutputParserWithRetries
    )

    @property
    def observation_prefix(self) -> str:
        """Prefix to append the observation with."""
        return "Observation:"

    @property
    def llm_prefix(self) -> str:
        """Prefix to append the llm call with."""
        return ""

    def _construct_scratchpad(
        self, intermediate_steps: List[Tuple[AgentAction, str]]
    ) -> str:
        agent_scratchpad = super()._construct_scratchpad(intermediate_steps)
        if not isinstance(agent_scratchpad, str):
            raise ValueError("agent_scratchpad should be of type string.")
        if agent_scratchpad:
            return (
                f"This was your previous work "
                f"(but I haven't seen any of it! I only see what "
                f"you return as final answer):\n{agent_scratchpad}"
            )
        else:
            return agent_scratchpad

    @classmethod
    def _validate_tools(cls, tools: Sequence[BaseTool]) -> None:
        pass

    @classmethod
    def _get_default_output_parser(
        cls, llm: Optional[BaseLanguageModel] = None, **kwargs: Any
    ) -> AgentOutputParser:
        return TaskManagerOutputParserWithRetries.from_llm(llm=llm)

    @property
    def _stop(self) -> List[str]:
        return ["Observation:"]

    @classmethod
    def create_prompt(
        cls,
        tools: Sequence[BaseTool],
        prefix: str = PREFIX,
        suffix: str = SUFFIX,
        human_message_template: str = HUMAN_MESSAGE_TEMPLATE,
        format_instructions: str = FORMAT_INSTRUCTIONS,
        input_variables: Optional[List[str]] = None,
        memory_prompts: Optional[List[BasePromptTemplate]] = None,
    ) -> BasePromptTemplate:
        
        tool_strings = []
        for tool in tools:
            args_schema = re.sub("}", "}}}}", re.sub("{", "{{{{", str(tool.args)))
            tool_strings.append(f"{tool.name}: {tool.description}, args: {args_schema}")
        formatted_tools = "\n".join(tool_strings)
        tool_names = ", ".join([tool.name for tool in tools])

        if singlerag_retrieve:
            format_instructions = FORMAT_INSTRUCTIONS_AFTER_RETRIEVE
            prefix = PREFIX_AFTER_RETRIEVE
            suffix = SUFFIX_AFTER_RETRIEVE
        else:
            format_instructions = format_instructions.format(tool_names=tool_names)
            prefix = PREFIX
            suffix = SUFFIX
        
        template = "\n\n".join([prefix, formatted_tools, format_instructions, suffix])
        if input_variables is None:
            input_variables = ["input", "agent_scratchpad"]

        _memory_prompts = memory_prompts or []
        messages = [
            SystemMessagePromptTemplate.from_template(template),
            *_memory_prompts,
            HumanMessagePromptTemplate.from_template(human_message_template),
        ]

        singlerag_retrieve = True
        prompt =  ChatPromptTemplate(input_variables=input_variables, messages=messages)
        return prompt

    @classmethod
    def from_llm_and_tools(
        cls,
        llm: BaseLanguageModel,
        tools: Sequence[BaseTool],
        callback_manager: Optional[BaseCallbackManager] = None,
        output_parser: Optional[AgentOutputParser] = None,
        prefix: str = PREFIX,
        suffix: str = SUFFIX,
        human_message_template: str = HUMAN_MESSAGE_TEMPLATE,
        format_instructions: str = FORMAT_INSTRUCTIONS,
        input_variables: Optional[List[str]] = None,
        memory_prompts: Optional[List[BasePromptTemplate]] = None,
        **kwargs: Any,
    ) -> Agent:
        """Construct an agent from an LLM and tools."""
        global singlerag_retrieve
        singlerag_retrieve = False
        
        
        
        cls._validate_tools(tools)
        prompt = cls.create_prompt(
            tools,
            prefix=prefix,
            suffix=suffix,
            human_message_template=human_message_template,
            format_instructions=format_instructions,
            input_variables=input_variables,
            memory_prompts=memory_prompts,
        )
        llm_chain = LLMChain(
            llm=llm,
            prompt=prompt,
            callback_manager=callback_manager,
        )
        tool_names = [tool.name for tool in tools]
        _output_parser = output_parser or cls._get_default_output_parser(llm=llm)
        return cls(
            llm_chain=llm_chain,
            allowed_tools=tool_names,
            output_parser=_output_parser,
            **kwargs,
        )

    @property
    def _agent_type(self) -> str:
        raise ValueError

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



        # class SlatingChain(Chain):
        #     def _call(
        #         self,
        #         inputs: Dict[str, Any],
        #     ) -> Dict[str, str]:
                
        #         return {"slated": inputs["query"].split("Action input:")[1]}
            
        # class PosingChain(Chain):
        #     def _call(
        #         self,
        #         inputs: Dict[str, Any],
        #     ) -> Dict[str, str]:
                
        #         return {"input": tools[0].func(inputs["slated"])}




        # retrieving_chain = LLMChain(llm=llm, prompt=retrieving_prompt)
        # slating_chain = SlatingChain()
        # posing_chain = PosingChain()
        # answering_chain = LLMChain(llm=llm, prompt=answering_prompt)

        # simple_rag_chain = SequentialChain(
        #     chains = [retrieving_chain, slating_chain, posing_chain, answering_chain],
        #     input_variables = ["input"],
        #     output_variables = ["output"],
        #     verbose = True
        # )

        # return simple_rag_chain
        # return cls(agent=agent, tools=tools, **kwargs)
    