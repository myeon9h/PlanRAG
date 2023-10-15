#!/bin/bash
for ((var=1;var<=59;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique SingleRAG --dataset industry --question_num $var > outputs/SingleRAG/industry/q$var.out
done
