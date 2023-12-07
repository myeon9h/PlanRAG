#!/bin/bash
for ((var=1;var<=59;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique RAG --dataset building --data_format graph --question_num $var > outputs/RAG/building/graph/q$var.out
done
