import re
from typing import Union

from langchain.agents.agent import AgentOutputParser
from langchain.schema import AgentAction, AgentFinish, OutputParserException

from techniques.PlanRAG.PlanRAG.multiAgents.tri.data_collector.prompt import FORMAT_INSTRUCTIONS

#FINAL_THOUGHT_ACTION = "Thought:"
FINAL_ANSWER_ACTION = "Final data:"

remove_from_action_input = ["```", "sql", "SQL"]

class DataCollectorOutputParser(AgentOutputParser):
    def get_format_instructions(self) -> str:
        return FORMAT_INSTRUCTIONS

    def parse(self, text: str) -> Union[AgentAction, AgentFinish]:
        includes_answer = FINAL_ANSWER_ACTION in text
        regex = (
            #r"Database\s*\d*\s*:[\s]*(.*?)[\s]*Natural\s*\d*\s*language\s*\d*\s*query\s*\d*\s*:[\s]*(.*)"
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
            for remove_word in remove_from_action_input:
                action_input = action_input.replace(remove_word, "")
            tool_input = action_input.strip(" ")
            # ensure if its a well formed SQL query we don't remove any trailing " chars
            if tool_input.startswith("SELECT ") is False:
                tool_input = tool_input.strip('"')

            return AgentAction(action, tool_input, text)

        elif includes_answer:
            # regex = (
            #     r"Thought\s*\d*\s*:[\s]*(.*?)[\s]*\nFinal\s*\d*\s*data\s*\d*\s*:[\s]*(.*)"
            # )
            # final_match = re.search(regex, text, re.DOTALL)
            # if final_match:
            #     remind = final_match.group(1).strip()
            #     final_data = final_match.group(2).strip()
            # else:
            #     raise OutputParserException(
            #         f"Could not parse LLM output: `{text}`",
            #         observation="Invalid Format: Missing 'Thought:' after 'Thought:'",
            #         llm_output=text,
            #         send_to_llm=True,
            #     )
            # return AgentFinish(
            #     {"output": "Data collector response: " + remind + "\n" + final_data}, text
            # )
            return AgentFinish(
                {"output": text.split(FINAL_ANSWER_ACTION)[-1].strip()}, text
            )

        #if not re.search(r"Database\s*\d*\s*:[\s]*(.*?)", text, re.DOTALL):
        if not re.search(r"Action\s*\d*\s*:[\s]*(.*?)", text, re.DOTALL):
            raise OutputParserException(
                f"Could not parse LLM output: `{text}`",
                observation="Invalid Format: Missing 'Database:' after 'Thought:'",
                llm_output=text,
                send_to_llm=True,
            )
        elif not re.search(
            #r"[\s]*Natural\s*\d*\s*language\s*\d*\s*query\s*\d*\s*:[\s]*(.*)", text, re.DOTALL
            r"[\s]*Action\s*\d*\s*input\s*\d*\s*:[\s]*(.*)", text, re.DOTALL
        ):
            raise OutputParserException(
                f"Could not parse LLM output: `{text}`",
                observation="Invalid Format:"
                " Missing 'Natural language input:' after 'Database:'",
                llm_output=text,
                send_to_llm=True,
            )
        else:
            raise OutputParserException(f"Could not parse LLM output: `{text}`")

    @property
    def _type(self) -> str:
        return "DATA COLLECTOR"
