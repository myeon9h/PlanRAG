#!/bin/bash
for ((var=1;var<=59;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique RAG --dataset building --question_num $var > outputs/RAG/building/q$var.out
done
