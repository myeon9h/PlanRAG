#!/bin/bash
for ((var=1;var<=112;var++))
#for var in 1 2
do
       echo $var
       python src/main-fewshot.py --fewshot True  --technique SingleRAG --scenario building --database graph --question_num $var > outputs/SingleRAG/building/graph/q$var.out
done
