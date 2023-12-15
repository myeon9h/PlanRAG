#!/bin/bash
for ((var=1;var<=59;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique IterRAG --scenario building --database relational --question_num $var > outputs/IterRAG/building/relational/q$var.out
done
