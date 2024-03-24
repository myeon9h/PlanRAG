#!/bin/bash
mkdir -p outputs/PlanRAG/building/graph

for ((var=1;var<=91;var++))

do
       echo $var
       python src/main.py --technique PlanRAG --scenario building --database graph --device 7 --model gpt-4 --question_num $var > outputs/PlanRAG/building/graph/q$var.out
done
