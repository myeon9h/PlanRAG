#!/bin/bash
mkdir -p outputs/PlanRAG/locating/relational

for ((var=1;var<=202;var++))
#for var in 1 2
do
       echo $var
       python src/main-fewshot.py --fewshot True  --technique PlanRAG --scenario locating --database relational  --device 6 --model gpt-3.5-turbo --question_num $var > outputs/PlanRAG/locating/relational/q$var.out
done
