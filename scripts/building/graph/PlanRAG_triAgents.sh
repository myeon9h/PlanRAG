#!/bin/bash
for ((var=92;var<=139;var++))
#for var in 1 2
do
       echo $var
       python src/run_multiAgents.py --technique PlanRAG --agent tri --dataset building --question_num $var > outputs/PlanRAG_multiAgents/tri/building/graph/q$var.out
done
