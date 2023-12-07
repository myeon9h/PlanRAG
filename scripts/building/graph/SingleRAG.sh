#!/bin/bash
for ((var=1;var<=59;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique SingleRAG --dataset building --data_format graph --question_num $var > outputs/SingleRAG/building/graph/q$var.out
done
