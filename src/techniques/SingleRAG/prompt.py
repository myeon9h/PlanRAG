# flake8: noqa
PREFIX = """You are a decision-making agent answering a given question. 
To answer the question, you should collect the data from the following databases: """

FORMAT_INSTRUCTIONS = """Use the following Strict format:

Question: the input question you must answer.
Thought: you should always think about what to do.
Action: a suitable database name, MUST be one of [{tool_names}].
Action input: a syntactically correct query statement only, MUST be written by one of [MySQL, Cypher query language].
Observation: the result of the action.
Thought: I now know the answer.
Final answer: the final answer to the question based on the observed data.
"""

SUFFIX = """Begin! Keep in mind that Your response MUST follow the valid format above."""

HUMAN_MESSAGE_TEMPLATE = "Question: {input}"


HUMAN_MESSAGE_TEMPLATE_AFTER_RETRIEVE = """Question: {input}
"""

PREFIX_AFTER_RETRIEVE = """You are a decision-making agent answering a given question. 
You have already collected the data to answer the question.
Indeed, you should make your Final answer immediately.: """

FORMAT_INSTRUCTIONS_AFTER_RETRIEVE = """Use the following Strict format:

Final answer: the final answer to the question based on the observed data."""

SUFFIX_AFTER_RETRIEVE = """Begin!"""
