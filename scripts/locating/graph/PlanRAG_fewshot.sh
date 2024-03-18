mkdir -p outputs/PlanRAG_fewshot/locating/graph

for ((var=10;var<=81;var++))
#for var in 1 2
do
       echo $var
       python src/main-fewshot.py --fewshot True  --technique PlanRAG_fewshot --scenario locating --database graph --question_num $var > outputs/PlanRAG_fewshot/locating/graph/q$var.out
done
