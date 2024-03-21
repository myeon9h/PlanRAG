#!/bin/bash
mkdir -p outputs/IterRAG/building/relational


for ((var=1;var<=112;var++))
#for var in 1 2
do
       echo $var
       python src/main-fewshot.py --fewshot True  --technique IterRAG --scenario building --database relational --device 5 --model gpt-3.5-turbo --question_num $var > outputs/IterRAG/building/relational/q$var.out
done
