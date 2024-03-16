#!/bin/bash
mkdir -p outputs/PlanRAG/building/graph

for ((var=1;var<=112;var++))

do
       echo $var
       python src/main.py --technique PlanRAG --scenario building --database graph --device 7 --model meta-llama/Llama-2-70b-hf --question_num $var > outputs/PlanRAG/building/graph/q$var.out
done
