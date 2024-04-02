#!/bin/bash

mkdir -p outputs/PlanRAG_woReplan/building/relational

for ((var=92;var<=139;var++))
#for var in 1 2
do
       echo $var
       python src/main.py   --technique PlanRAG_woReplan --scenario building --database relational --question_num $var > outputs/PlanRAG_woReplan/building/relational/q$var.out
done
