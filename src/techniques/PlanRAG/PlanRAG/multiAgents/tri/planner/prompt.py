PREFIX = """You are a Planner who plans to collect the data to answer a given question.
"""
"""Keep in mind that a plan must not include any step related to answer the given question directly."""

DB_INSTRUCTIONS = """Make a data collection plan considering only the following databases:\n\n"""
GDB_DESCRIPTIONS = """Graph DB contains graph data that follows the following schema:\n{gdb_info}"""

FORMAT_INSTRUCTIONS = """Use the following Strict format: 

Question: the given question.
Thought: your thoughts about what data will be needed to answer the given question.
Plan: [Step 1: requirement 1, Step 2: requirement 2, ..., Step N: requirement N]."""

SUFFIX = """Begin!"""

HUMAN_MESSAGE_TEMPLATE = "Question: {input}\n\n{agent_scratchpad}"