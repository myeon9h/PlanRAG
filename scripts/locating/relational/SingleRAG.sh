#!/bin/bash
for ((var=1;var<=202;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique SingleRAG --scenario locating --database relational --question_num $var > outputs/SingleRAG/locating/relational/q$var.out
done
