#!/bin/bash
for ((var=1;var<=81;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique RAG --dataset locating --data_format graph --question_num $var > outputs/RAG/locating/graph/q$var.out
done
