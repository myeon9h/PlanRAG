#!/bin/bash
mkdir -p outputs/IterRAG/building/graph


for ((var=1;var<=91;var++))
do
       echo $var
       python src/main-fewshot.py --fewshot True  --technique IterRAG --scenario building --database graph --device 4 --model gpt-3.5-turbo --question_num $var > outputs/IterRAG/building/graph/q$var.out
done
