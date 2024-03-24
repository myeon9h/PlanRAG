#!/bin/bash
mkdir -p outputs/PlanRAG/locating/relational

# for ((var=1;var<=202;var++))
numbers=(88 108 128 159 164)

for var in "${numbers[@]}"
do
       echo $var
       python src/main.py --technique PlanRAG --scenario locating --database relational  --device 6 --model gpt-4 --question_num $var > outputs/PlanRAG/locating/relational/q$var.out
done
