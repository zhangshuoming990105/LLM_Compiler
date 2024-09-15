# bash baseline.sh modelname
# modelname: the name of the model to be used
python main.py --model $1 --temperature 0.6 --begin_id 0 --end_id $2 --pass_k 5 --self_correct True \
--do_analyze True --correct_round 3 --prompt_style lego --use_mask True --mask_stage annotation