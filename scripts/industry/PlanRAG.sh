#!/bin/bash
for ((var=1;var<=81;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique PlanRAG --dataset industry --question_num $var > outputs/PlanRAG/PlanRAG/industry/q$var.out
done
