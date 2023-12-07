#!/bin/bash
for ((var=1;var<=59;var++))
#for var in 1 2
do
       echo $var
       python src/run_multiAgents.py --technique PlanRAG --agent dual --dataset building --question_num $var > outputs/PlanRAG/multiAgents/dual/building/q$var.out
done
