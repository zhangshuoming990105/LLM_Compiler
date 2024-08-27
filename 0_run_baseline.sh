# bash baseline.sh modelname
# modelname: the name of the model to be used
python main.py --model $1 --temperature 0.5 --begin_id 0 --end_id 500 --pass_k 1