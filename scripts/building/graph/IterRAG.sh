#!/bin/bash
for ((var=1;var<=59;var++))
do
       echo $var
       python src/main.py --technique IterRAG --scenario building --database graph --question_num $var > outputs/IterRAG/building/graph/q$var.out
done
