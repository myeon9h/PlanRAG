#!/bin/bash
for ((var=1;var<=59;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique RAG --dataset building --data_format table --question_num $var > outputs/RAG/building/table/q$var.out
done
