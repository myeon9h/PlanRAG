#!/bin/bash
for ((var=1;var<=81;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique PlanRAG --dataset trading --question_num $var > outputs/PlanRAG/PlanRAG/trading/q$var.out
done
