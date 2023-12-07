# flake8: noqa
PREFIX = """You are a decision-making agent answering a given question.
You should collect the data to answer the question by using a Data collector.
To this end, first, you need to plan which data would be needed in what order.
Then, request the Data collector step-by-step to collect the data.
Keep in mind that the question can require to access following databases multiple times: """

DB_INSTRUCTIONS = """Keep in mind that the Data collector can access the following databases:\n\n"""
GDB_DESCRIPTIONS = """Graph DB contains graph data that follows the following schema:\n{gdb_info}"""

FORMAT_INSTRUCTIONS = """Use the following Strict format:

Question: the input question you must answer.
Plan: [Step 1: requirement 1, Step 2: requirement 2, ..., Step N: requirement N].
Current step: the current Step in the Plan.
Thought: you should always think about the Current step.
Action: Data collector
Action input: current step's requirement.
Observation: the response from the Data collector
Re-plan: respond with 'Y' and change your Plan if you think a current Plan is not helpful, otherwise respond with 'N' and continue a process based on the current Plan.
... (a process of Plan, Current step, Thought, Action, Action input, Observation, and Re-plan can repeat N times)
Thought: I now know the answer.
Final answer: the final answer to the question based on the observed data.
"""
"""
Thought: your thought about the Observations and the current plan.
"""

SUFFIX = """Begin! Keep in mind that Your response MUST follow the valid format above."""

HUMAN_MESSAGE_TEMPLATE = "Question: {input}\n\n{agent_scratchpad}"