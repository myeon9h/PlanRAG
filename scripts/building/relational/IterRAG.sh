#!/bin/bash
mkdir -p outputs/IterRAG/building/relational

for ((var=1;var<=91;var++))
do
       echo $var
       python src/main.py --technique IterRAG --scenario building --database relational --device 5 --model gpt-4 --question_num $var > outputs/IterRAG/building/relational/q$var.out
done
