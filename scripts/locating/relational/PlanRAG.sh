#!/bin/bash
mkdir -p outputs/PlanRAG/locating/relational

for ((var=1;var<=81;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique PlanRAG --scenario locating --database relational  --device 6 --model meta-llama/Llama-2-13b-hf --question_num $var > outputs/PlanRAG/locating/relational/q$var.out
done
