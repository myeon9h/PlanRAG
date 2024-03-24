#!/bin/bash
mkdir -p outputs/SingleRAG/building/relational

for ((var=1;var<=91;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique SingleRAG --scenario building --database relational --question_num $var > outputs/SingleRAG/building/relational/q$var.out
done
