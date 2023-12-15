#!/bin/bash
for ((var=1;var<=59;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique PlanRAG --scenario building --database relational --question_num $var > outputs/PlanRAG/building/relational/q$var.out
done
