#!/bin/bash
mkdir -p outputs/IterRAG/building/graph


for ((var=1;var<=112;var++))
do
       echo $var
       python src/main-copy.py --technique IterRAG --scenario building --database graph --device 4 --model meta-llama/Llama-2-70b-hf --question_num $var > outputs/IterRAG/building/graph/q$var.out
done
