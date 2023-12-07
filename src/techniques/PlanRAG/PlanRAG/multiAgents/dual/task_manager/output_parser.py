from __future__ import annotations

import json
import logging
import re
from typing import Optional, Union

from pydantic import Field

from langchain.agents.agent import AgentOutputParser
from langchain.base_language import BaseLanguageModel
from langchain.output_parsers import OutputFixingParser
from langchain.schema import AgentAction, AgentFinish, OutputParserException

from techniques.PlanRAG.PlanRAG.multiAgents.dual.task_manager.prompt import FORMAT_INSTRUCTIONS

FINAL_ANSWER_ACTION = "Final answer:"

class TaskManagerOutputParser(AgentOutputParser):
    def get_format_instructions(self) -> str:
        return FORMAT_INSTRUCTIONS

    def parse(self, text: str) -> Union[AgentAction, AgentFinish]:
        includes_answer = FINAL_ANSWER_ACTION in text
        regex = (
            r"Action\s*\d*\s*:[\s]*(.*?)[\s]*Action\s*\d*\s*input\s*\d*\s*:[\s]*(.*)"
        )
        action_match = re.search(regex, text, re.DOTALL)
        if action_match:
            if includes_answer:
                raise OutputParserException(
                    "Parsing LLM output produced both a final answer "
                    f"and a parse-able action: {text}"
                )
            action = action_match.group(1).strip()
            action_input = action_match.group(2)
            tool_input = action_input.strip(" ")
            # ensure if its a well formed SQL query we don't remove any trailing " chars
            if tool_input.startswith("SELECT ") is False:
                tool_input = tool_input.strip('"')

            return AgentAction(action, tool_input, text)

        elif includes_answer:
            return AgentFinish(
                {"output": text.split(FINAL_ANSWER_ACTION)[-1].strip()}, text
            )

        if not re.search(r"Action\s*\d*\s*:[\s]*(.*?)", text, re.DOTALL):
            raise OutputParserException(
                f"Could not parse LLM output: `{text}`",
                observation="Invalid Format: Missing 'Action:'",
                llm_output=text,
                send_to_llm=True,
            )
        elif not re.search(
            r"[\s]*Action\s*\d*\s*input\s*\d*\s*:[\s]*(.*)", text, re.DOTALL
        ):
            raise OutputParserException(
                f"Could not parse LLM output: `{text}`",
                observation="Invalid Format:"
                " Missing 'Action input:' after 'Action:'",
                llm_output=text,
                send_to_llm=True,
            )
        else:
            raise OutputParserException(f"Could not parse LLM output: `{text}`")
    # def parse(self, text: str) -> Union[AgentAction, AgentFinish]:
    #     if FINAL_ANSWER_ACTION in text:
    #         return AgentFinish(
    #             {"output": text.split(FINAL_ANSWER_ACTION)[-1].strip()}, text
    #         )
    #     # \s matches against tab/newline/whitespace
    #     regex = (
    #         #r"Database\s*\d*\s*:[\s]*(.*?)[\s]*Database\s*\d*\s*query\s*\d*\s*:[\s]*(.*)"
    #         r"Action\s*\d*\s*:[\s]*(.*?)[\s]*Action\s*\d*\s*input\s*\d*\s*:[\s]*(.*)"
    #     )
    #     match = re.search(regex, text, re.DOTALL)
    #     if not match:
    #         raise OutputParserException(f"Could not parse LLM output: `{text}`")
    #     action = match.group(1).strip()
    #     action_input = match.group(2)
    #     return AgentAction(action, action_input.strip(" ").strip('"'), text)

    @property
    def _type(self) -> str:
        return "TASK MANAGER"

    # def get_format_instructions(self) -> str:
    #     return FORMAT_INSTRUCTIONS

    # def parse(self, text: str) -> Union[AgentAction, AgentFinish]:
    #     try:
    #         action_match = re.search(r"```(.*?)```?", text, re.DOTALL)
    #         if action_match is not None:
    #             response = json.loads(action_match.group(1).strip(), strict=False)
    #             if isinstance(response, list):
    #                 # gpt turbo frequently ignores the directive to emit a single action
    #                 logger.warning("Got multiple action responses: %s", response)
    #                 response = response[0]
    #             if response["action"] == "Final Answer":
    #                 return AgentFinish({"output": response["action_input"]}, text)
    #             else:
    #                 return AgentAction(
    #                     response["action"], response.get("action_input", {}), text
    #                 )
    #         else:
    #             return AgentFinish({"output": text}, text)
    #     except Exception as e:
    #         raise OutputParserException(f"Could not parse LLM output: {text}") from e

    # @property
    # def _type(self) -> str:
    #     return "master"


class TaskManagerOutputParserWithRetries(AgentOutputParser):
    base_parser: AgentOutputParser = Field(default_factory=TaskManagerOutputParser)
    output_fixing_parser: Optional[OutputFixingParser] = None

    def get_format_instructions(self) -> str:
        return FORMAT_INSTRUCTIONS

    def parse(self, text: str) -> Union[AgentAction, AgentFinish]:
        try:
            if self.output_fixing_parser is not None:
                parsed_obj: Union[
                    AgentAction, AgentFinish
                ] = self.output_fixing_parser.parse(text)
            else:
                parsed_obj = self.base_parser.parse(text)
            return parsed_obj
        except Exception as e:
            raise OutputParserException(f"Could not parse LLM output: {text}") from e

    @classmethod
    def from_llm(
        cls,
        llm: Optional[BaseLanguageModel] = None,
        base_parser: Optional[TaskManagerOutputParser] = None,
    ) -> TaskManagerOutputParserWithRetries:
        if llm is not None:
            base_parser = base_parser or TaskManagerOutputParser()
            output_fixing_parser = OutputFixingParser.from_llm(
                llm=llm, parser=base_parser
            )
            return cls(output_fixing_parser=output_fixing_parser)
        elif base_parser is not None:
            return cls(base_parser=base_parser)
        else:
            return cls()

    @property
    def _type(self) -> str:
        return "TASK MANAGER WITH RETRIES"
