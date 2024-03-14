#!/bin/bash
mkdir -p outputs/PlanRAG/building/graph

for ((var=1;var<=59;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique PlanRAG --scenario building --database graph --device 7 --model meta-llama/Llama-2-13b-hf --question_num $var > outputs/PlanRAG/building/graph/q$var.out
done
