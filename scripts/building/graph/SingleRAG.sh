#!/bin/bash
mkdir -p outputs/SingleRAG/building/graph

for ((var=92;var<=139;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique SingleRAG --scenario building --database graph --question_num $var > outputs/SingleRAG/building/graph/q$var.out
done
