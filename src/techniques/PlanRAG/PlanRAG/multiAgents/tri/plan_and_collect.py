from typing import Any, Dict, List, Optional

from langchain.chains.base import Chain

from techniques.PlanRAG.PlanRAG.multiAgents.tri.data_collector.base import DataCollectorChain as DataCollector
from techniques.PlanRAG.PlanRAG.multiAgents.tri.planner.base import PlannerChain as Planner

import re

class PlanAndCollect(Chain):

    planner: Planner
    dataCollector: DataCollector
    #step_container: BaseStepContainer = Field(default_factory=ListStepContainer)
    """The step container to use."""
    input_key: str = "input"
    output_key: str = "output"

    @property
    def input_keys(self) -> List[str]:
        return [self.input_key]

    @property
    def output_keys(self) -> List[str]:
        return [self.output_key]

    def parse_plan(self, plan: str) -> List[str]:
        steps = []
        #step_matches = re.findall(r'Step (\d+): ([^,]+)', plan)
        step_matches = re.findall(r'Step (\d+): [\s]*(.*)', plan)
        for step_match in step_matches:
            steps.append(step_match[1])
        return steps

    def _call(self, inputs: dict) -> str:
        requirement = inputs[self.input_key]
        raw_plan = str(self.planner.run(requirement))
        plan = self.parse_plan(plan=raw_plan)
    
        outputs = ""
        histories = "Previous histories:\n"
        for step in plan:
            if histories == "Previous histories:\n": # first step
                input = ("Requirement: " + step + "\n")
            else:
                input = (histories + "Requirement: " + step + "\n") 
            #print(input)
            response = self.dataCollector.run(input)
            outputs += (response + "\n")
            histories += ("Previous requirement: " + step + "\nPrevious observation: " + response + "\n")
            #outputs += "Data: " + step + response + "\n"

        return {self.output_key: outputs}