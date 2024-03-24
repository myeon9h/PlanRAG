#!/bin/bash

mkdir -p outputs/IterRAG/locating/graph

for ((var=1;var<=202;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique IterRAG --scenario locating --database graph --device 7 --model gpt-4 --question_num $var > outputs/IterRAG/locating/graph/q$var.out
done
