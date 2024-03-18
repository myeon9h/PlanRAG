#!/bin/bash
for ((var=1;var<=112;var++))
#for var in 1 2
do
       echo $var
       python src/main-fewshot.py --fewshot True  --technique PlanRAG_woReplan --scenario building --database relational --question_num $var > outputs/PlanRAG_woReplan/building/relational/q$var.out
done
