#!/bin/bash
mkdir -p outputs/IterRAG/building/graph


for ((var=1;var<=91;var++))
do
       echo $var
       python src/main.py --technique IterRAG --scenario building --database graph --device 4 --model gpt-4 --question_num $var > outputs/IterRAG/building/graph/q$var.out
done
