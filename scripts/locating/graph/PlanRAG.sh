#!/bin/bash
for ((var=1;var<=81;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique PlanRAG --scenario locating --database graph --question_num $var > outputs/PlanRAG/locating/graph/q$var.out
done
