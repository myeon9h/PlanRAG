mkdir -p outputs/PlanRAG_fewshot/building/relational

for ((var=1;var<=59;var++))
#for var in 1 2
do
       echo $var
       python src/main-fewshot.py --fewshot True  --technique PlanRAG_fewshot --scenario locating --database relational --question_num $var > outputs/PlanRAG_fewshot/building/relational/q$var.out
done
