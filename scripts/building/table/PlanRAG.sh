#!/bin/bash
for ((var=1;var<=59;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique PlanRAG --dataset building --data_format table --question_num $var > outputs/PlanRAG/building/table/q$var.out
done
