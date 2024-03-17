#!/bin/bash
mkdir -p outputs/IterRAG/building/graph


for ((var=1;var<=112;var++))
do
       echo $var
       python src/main.py --technique IterRAG --scenario building --database graph --device 4 --model gpt-3.5-turbo --question_num $var > outputs/IterRAG/building/graph/q$var.out
done
