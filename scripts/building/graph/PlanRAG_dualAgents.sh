#!/bin/bash
for ((var=1;var<=112;var++))
#for var in 1 2
do
       echo $var
       python src/run_multiAgents.py --technique PlanRAG --agent dual --dataset building --question_num $var > outputs/PlanRAG_multiAgents/dual/building/graph/q$var.out
done
