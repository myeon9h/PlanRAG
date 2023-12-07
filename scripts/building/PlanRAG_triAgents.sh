#!/bin/bash
for ((var=1;var<=59;var++))
#for var in 1 2
do
       echo $var
       python src/run_multiAgents.py --technique PlanRAG --agent tri --dataset building --question_num $var > outputs/PlanRAG/multiAgents/tri/building/q$var.out
done
