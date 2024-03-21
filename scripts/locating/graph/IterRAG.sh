#!/bin/bash

mkdir -p outputs/IterRAG/locating/graph

for ((var=1;var<=202;var++))
#for var in 1 2
do
       echo $var
       python src/main-fewshot.py --fewshot True  --technique IterRAG --scenario locating --database graph --device 7 --model gpt-3.5-turbo --question_num $var > outputs/IterRAG/locating/graph/q$var.out
done
