#!/bin/bash
for ((var=1;var<=81;var++))
#for var in 1 2
do
       echo $var
       python src/run_multiAgents.py --technique PlanRAG --agent dual --dataset locating --question_num $var > outputs/PlanRAG/multiAgents/dual/locating/q$var.out
done
