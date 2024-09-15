# bash baseline.sh modelname
# modelname: the name of the model to be used
python main.py --model $1 --temperature 0.0 --begin_id 0 --end_id 100 --use_mask False