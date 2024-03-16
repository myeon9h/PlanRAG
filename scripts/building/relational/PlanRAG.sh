#!/bin/bash
mkdir -p outputs/PlanRAG/building/relational


for ((var=1;var<=112;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique PlanRAG --scenario building --database relational --device 6 --model meta-llama/Llama-2-70b-hf --question_num $var > outputs/PlanRAG/building/relational/q$var.out
done
