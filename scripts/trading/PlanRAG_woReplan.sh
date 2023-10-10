#!/bin/bash
for ((var=1;var<=81;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique PlanRAG_woReplan --dataset trading --question_num $var > outputs/PlanRAG/PlanRAG_woReplan/trading/q$var.out
done
