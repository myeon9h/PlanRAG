import re
from typing import Union

from langchain.agents.agent import AgentOutputParser
from langchain.schema import AgentAction, AgentFinish, OutputParserException

from techniques.PlanRAG.PlanRAG.multiAgents.tri.planner.prompt import FORMAT_INSTRUCTIONS

#FINAL_THOUGHT_ACTION = "Thought:"
FINAL_ANSWER_ACTION = "Plan:"

class PlannerOutputParser(AgentOutputParser):
    def get_format_instructions(self) -> str:
        return FORMAT_INSTRUCTIONS

    def parse(self, text: str) -> Union[AgentAction, AgentFinish]:
        includes_answer = FINAL_ANSWER_ACTION in text
        
        if includes_answer:
            return AgentFinish(
                {"output": text.split(FINAL_ANSWER_ACTION)[-1].strip()}, text
            )
        else:
            raise OutputParserException(
                f"Could not parse LLM output: `{text}`",
                observation="Invalid Format: Missing 'Plan:'",
                llm_output=text,
                send_to_llm=True,
            )
        
    @property
    def _type(self) -> str:
        return "PLANNER"
