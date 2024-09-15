# bash baseline.sh modelname temperature
# modelname: the name of the model to be used, use k=5 for pass@k
python main.py --model $1 --temperature $2 --pass_k 5 --begin_id 0 --end_id 100 