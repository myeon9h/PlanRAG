# flake8: noqa
PREFIX = """You are a decision-making agent answering the given question.
To this end, first, you need to collect the data to answer the question by using a Data collector.
Then, answer the question.
Keep in mind that the question can require to access following databases multiple times:"""

DB_INSTRUCTIONS = """Keep in mind that the Data collector can access the following schema:\n\n"""
GDB_DESCRIPTIONS = """Graph DB contains graph data that follows the following schema:\n{gdb_info}"""

FORMAT_INSTRUCTIONS = """Use the following Strict format:

Question: the input question you must answer.
Thought: your thoughts to answer the question.
Action: Data collector
Action input: your question sent to the Data collector to obatin necessary data.
Observation: the response from the Data collector
... (a process of Thought, Action, Action input, and Observation can repeat N times)
Thought: I now know the answer.
Final answer: the final answer to the question based on the observed data.
"""

"""
If you think the given data is not sufficient to answer the given question, you can ask for more data."""

# If you think there is no enough data to answer the given question, then:
#     Action: Get info
#     Action input: your question to get more information you need to answer the question.
# Otherwise:
#     Thought: I know the answer.
#     Final answer: the final answer to the question based on the observed data.

SUFFIX = """Begin! Keep in mind that Your response MUST follow the valid format above."""

HUMAN_MESSAGE_TEMPLATE = "Question: {input}\n\n{agent_scratchpad}"