#!/bin/bash
mkdir -p outputs/PlanRAG/locating/graph

for ((var=143;var<=202;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique PlanRAG --scenario locating --database graph --device 7 --model meta-llama/Llama-2-70b-hf --question_num $var > outputs/PlanRAG/locating/graph/q$var.out
done
