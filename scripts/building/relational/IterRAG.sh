#!/bin/bash
mkdir -p outputs/IterRAG/building/relational


for ((var=1;var<=59;var++))
#for var in 1 2
do
       echo $var
       python src/main-copy.py --technique IterRAG --scenario building --database relational --device 5 --model meta-llama/Llama-2-13b-hf --question_num $var > outputs/IterRAG/building/relational/q$var.out
done
