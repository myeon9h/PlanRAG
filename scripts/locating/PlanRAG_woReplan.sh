#!/bin/bash
for ((var=1;var<=81;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique PlanRAG_woReplan --dataset locating --question_num $var > outputs/PlanRAG/PlanRAG_woReplan/locating/q$var.out
done
