#!/bin/bash
for ((var=1;var<=81;var++))
#for var in 1 2
do
       echo $var
       python src/run_multiAgents.py --technique PlanRAG --agent tri --dataset locating --question_num $var > outputs/PlanRAG/multiAgents/tri/locating/q$var.out
done
