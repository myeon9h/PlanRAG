#!/bin/bash
mkdir -p outputs/PlanRAG/building/relational


for ((var=1;var<=91;var++))
#for var in 1 2
do
       echo $var
       python src/main-fewshot.py --fewshot True  --technique PlanRAG --scenario building --database relational --device 6 --model gpt-3.5-turbo --question_num $var > outputs/PlanRAG/building/relational/q$var.out
done
