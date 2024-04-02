#!/bin/bash
mkdir -p outputs/IterRAG/locating/relational

for ((var=1;var<=202;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique IterRAG --scenario locating --database relational --device 6 --model gpt-4 --question_num $var > outputs/IterRAG/locating/relational/q$var.out
done
