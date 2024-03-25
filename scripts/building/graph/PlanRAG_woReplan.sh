#!/bin/bash

mkdir -p outputs/PlanRAG_woReplan/building/graph

for ((var=92;var<=139;var++))
#for var in 1 2
do
       echo $var
       python src/main.py  --technique PlanRAG_woReplan --scenario building --database graph --question_num $var > outputs/PlanRAG_woReplan/building/graph/q$var.out
done
