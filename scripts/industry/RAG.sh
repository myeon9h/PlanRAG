#!/bin/bash
for ((var=1;var<=59;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique RAG --dataset industry --question_num $var > outputs/RAG/industry/q$var.out
done
