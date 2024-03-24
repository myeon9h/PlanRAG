mkdir -p outputs/IterRAG_fewshot/locating/relational

for ((var=1;var<=81;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique IterRAG_fewshot --scenario locating --database relational --question_num $var > outputs/IterRAG_fewshot/locating/relational/q$var.out
done
