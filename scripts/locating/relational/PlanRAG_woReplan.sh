#!/bin/bash
for ((var=1;var<=202;var++))
#for var in 1 2
do
       echo $var
       python src/main-fewshot.py --fewshot True  --technique PlanRAG_woReplan --scenario locating --database relational --question_num $var > outputs/PlanRAG_woReplan/locating/relational/q$var.out
done
