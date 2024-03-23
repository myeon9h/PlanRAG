#!/bin/bash
mkdir -p outputs/PlanRAG/building/graph

for ((var=1;var<=91;var++))

do
       echo $var
       python src/main-fewshot.py --fewshot True  --technique PlanRAG --scenario building --database graph --device 7 --model gpt-3.5-turbo --question_num $var > outputs/PlanRAG/building/graph/q$var.out
done
