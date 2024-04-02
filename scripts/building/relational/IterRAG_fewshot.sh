mkdir -p outputs/IterRAG_fewshot/building/relational

for ((var=1;var<=59;var++))
#for var in 1 2
do
       echo $var
       python src/main.py --technique IterRAG_fewshot --scenario building --database relational --question_num $var > outputs/IterRAG_fewshot/building/relational/q$var.out
done
