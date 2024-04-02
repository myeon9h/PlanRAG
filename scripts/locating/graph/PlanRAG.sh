#!/bin/bash
mkdir -p outputs/PlanRAG/locating/graph

# for ((var=1;var<=202;var++))
#for var in 1 2
numbers=(57 74 82 91 94)

for var in "${numbers[@]}"
do
       echo $var
       python src/main.py --technique PlanRAG --scenario locating --database graph --device 7 --model gpt-4 --question_num $var > outputs/PlanRAG/locating/graph/q$var.out
done
