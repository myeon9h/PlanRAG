"""Attempt to implement Database selection system."""
from __future__ import annotations

from typing import Any, Callable, List, NamedTuple, Optional, Sequence

from pydantic import Field

from langchain.agents.agent import Agent, AgentExecutor, AgentOutputParser
from langchain.base_language import BaseLanguageModel
from langchain.callbacks.base import BaseCallbackManager
from langchain.chains.llm import LLMChain
from langchain.prompts.base import BasePromptTemplate
from langchain.prompts.chat import (
    ChatPromptTemplate,
    HumanMessagePromptTemplate,
    SystemMessagePromptTemplate,
)
from langchain.schema import AgentAction
from langchain.tools import BaseTool

from techniques.PlanRAG.PlanRAG.multiAgents.tri.planner.output_parser import PlannerOutputParser
from techniques.PlanRAG.PlanRAG.multiAgents.tri.planner.prompt import (
    FORMAT_INSTRUCTIONS, PREFIX, SUFFIX, HUMAN_MESSAGE_TEMPLATE,
    DB_INSTRUCTIONS, GDB_DESCRIPTIONS
)

class ChainConfig(NamedTuple):
    """Configuration for chain to use in MRKL system.

    Args:
        action_name: Name of the action.
        action: Action function to call.
        action_description: Description of the action.
    """

    action_name: str
    action: Callable
    action_description: str


class Planner(Agent):
    output_parser: AgentOutputParser = Field(
        default_factory=PlannerOutputParser
    )

    @property
    def observation_prefix(self) -> str:
        """Prefix to append the observation with."""
        return ""

    @property
    def llm_prefix(self) -> str:
        """Prefix to append the llm call with."""
        #return "Thought:"
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
    def _get_default_output_parser(cls, **kwargs: Any) -> AgentOutputParser:
        return PlannerOutputParser()

    @property
    def _stop(self) -> List[str]:
        return None

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
        gdb_info: Optional[str] = None,
    ) -> BasePromptTemplate:
        
        if gdb_info is not None:
            db_instructions = DB_INSTRUCTIONS
            db_instructions += GDB_DESCRIPTIONS.format(gdb_info=gdb_info)
        else:
            db_instructions = ""
        
        template = "\n\n".join([prefix, db_instructions, format_instructions, suffix])
        
        if input_variables is None:
            input_variables = ["input", "agent_scratchpad"]

        _memory_prompts = memory_prompts or []
        messages = [
            SystemMessagePromptTemplate.from_template(template),
            *_memory_prompts,
            HumanMessagePromptTemplate.from_template(human_message_template),
        ]
        return ChatPromptTemplate(input_variables=input_variables, messages=messages)

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
        gdb_info: Optional[str] = None,
        **kwargs: Any,
    ) -> Agent:
        """Construct an agent from an LLM and tools."""
        cls._validate_tools(tools)
        prompt = cls.create_prompt(
            tools,
            prefix=prefix,
            suffix=suffix,
            human_message_template=human_message_template,
            format_instructions=format_instructions,
            input_variables=input_variables,
            memory_prompts=memory_prompts,
            gdb_info=gdb_info,
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
    


class PlannerChain(AgentExecutor):
    """Chain that implements the MRKL system.

    Example:
        .. code-block:: python

            from langchain import OpenAI, MRKLChain
            from langchain.chains.mrkl.base import ChainConfig
            llm = OpenAI(temperature=0)
            prompt = PromptTemplate(...)
            chains = [...]
            mrkl = MRKLChain.from_chains(llm=llm, prompt=prompt)
    """

    @classmethod
    def from_llm_and_tools(
        cls, llm: BaseLanguageModel, tools: Sequence[BaseTool], 
        human_message_template: str = HUMAN_MESSAGE_TEMPLATE, 
        input_variables: Optional[List[str]] = None,
        gdb_info: Optional[str] = None, **kwargs: Any
    ) -> AgentExecutor:
        """User friendly way to initialize the MRKL chain.

        This is intended to be an easy way to get up and running with the
        MRKL chain.

        Args:
            llm: The LLM to use as the agent LLM.
            chains: The chains the MRKL system has access to.
            **kwargs: parameters to be passed to initialization.

        Returns:
            An initialized MRKL chain.

        Example:
            .. code-block:: python

                from langchain import LLMMathChain, OpenAI, SerpAPIWrapper, MRKLChain
                from langchain.chains.mrkl.base import ChainConfig
                llm = OpenAI(temperature=0)
                search = SerpAPIWrapper()
                llm_math_chain = LLMMathChain(llm=llm)
                chains = [
                    ChainConfig(
                        action_name = "Search",
                        action=search.search,
                        action_description="useful for searching"
                    ),
                    ChainConfig(
                        action_name="Calculator",
                        action=llm_math_chain.run,
                        action_description="useful for doing math"
                    )
                ]
                mrkl = MRKLChain.from_chains(llm, chains)
        """
        agent = Planner.from_llm_and_tools(llm, tools, human_message_template=human_message_template, input_variables=input_variables, gdb_info=gdb_info)
        return cls(agent=agent, tools=tools, **kwargs)

