#!/bin/bash
for ((var=1;var<=202;var++))
#for var in 1 2
do
       echo $var
       python src/main-fewshot.py --fewshot True  --technique PlanRAG_woReplan --scenario locating --database graph --question_num $var > outputs/PlanRAG_woReplan/locating/graph/q$var.out
done
