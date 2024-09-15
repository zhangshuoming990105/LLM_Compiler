# 0. Run all baselines
# large models
bash 0_run_baseline.sh gpt-4o
bash 0_run_baseline.sh deepseek-coder
bash 0_run_baseline.sh claude-3-5-sonnet-20240620
# small models
bash 0_run_baseline.sh gpt-4o-mini
bash 0_run_baseline.sh claude-3-haiku-20240307
bash 0_run_baseline.sh llama-3.1-70b-instruct
bash 0_run_baseline.sh deepseek-coder-v2:16b-lite-instruct-fp16
bash 0_run_baseline.sh codestral:22b-v0.1-f16
# temperature should be used together with pass@k
# 1. Run ablation studies on temperature
bash 1_run_temperature_ablation.sh gpt-4o 0.2
bash 1_run_temperature_ablation.sh gpt-4o 0.4
bash 1_run_temperature_ablation.sh gpt-4o 0.6
bash 1_run_temperature_ablation.sh gpt-4o 0.8
bash 1_run_temperature_ablation.sh gpt-4o 1.0

bash 1_run_temperature_ablation.sh deepseek-coder 0.2
bash 1_run_temperature_ablation.sh deepseek-coder 0.4
bash 1_run_temperature_ablation.sh deepseek-coder 0.6
bash 1_run_temperature_ablation.sh deepseek-coder 0.8
bash 1_run_temperature_ablation.sh deepseek-coder 1.0

bash 1_run_temperature_ablation.sh claude-3-5-sonnet-20240620 0.2
bash 1_run_temperature_ablation.sh claude-3-5-sonnet-20240620 0.4
bash 1_run_temperature_ablation.sh claude-3-5-sonnet-20240620 0.6
bash 1_run_temperature_ablation.sh claude-3-5-sonnet-20240620 0.8
bash 1_run_temperature_ablation.sh claude-3-5-sonnet-20240620 1.0


bash 1_run_temperature_ablation.sh gpt-4o-mini 0.2
bash 1_run_temperature_ablation.sh gpt-4o-mini 0.4
bash 1_run_temperature_ablation.sh gpt-4o-mini 0.6
bash 1_run_temperature_ablation.sh gpt-4o-mini 0.8
bash 1_run_temperature_ablation.sh gpt-4o-mini 1.0

bash 1_run_temperature_ablation.sh claude-3-haiku-20240307 0.2
bash 1_run_temperature_ablation.sh claude-3-haiku-20240307 0.4
bash 1_run_temperature_ablation.sh claude-3-haiku-20240307 0.6
bash 1_run_temperature_ablation.sh claude-3-haiku-20240307 0.8
bash 1_run_temperature_ablation.sh claude-3-haiku-20240307 1.0

bash 1_run_temperature_ablation.sh llama-3.1-70b-instruct 0.2
bash 1_run_temperature_ablation.sh llama-3.1-70b-instruct 0.4
bash 1_run_temperature_ablation.sh llama-3.1-70b-instruct 0.6
bash 1_run_temperature_ablation.sh llama-3.1-70b-instruct 0.8
bash 1_run_temperature_ablation.sh llama-3.1-70b-instruct 1.0

bash 1_run_temperature_ablation.sh deepseek-coder-v2:16b-lite-instruct-fp16 0.2
bash 1_run_temperature_ablation.sh deepseek-coder-v2:16b-lite-instruct-fp16 0.4
bash 1_run_temperature_ablation.sh deepseek-coder-v2:16b-lite-instruct-fp16 0.6
bash 1_run_temperature_ablation.sh deepseek-coder-v2:16b-lite-instruct-fp16 0.8
bash 1_run_temperature_ablation.sh deepseek-coder-v2:16b-lite-instruct-fp16 1.0

bash 1_run_temperature_ablation.sh codestral:22b-v0.1-f16 0.2
bash 1_run_temperature_ablation.sh codestral:22b-v0.1-f16 0.4
bash 1_run_temperature_ablation.sh codestral:22b-v0.1-f16 0.6
bash 1_run_temperature_ablation.sh codestral:22b-v0.1-f16 0.8
bash 1_run_temperature_ablation.sh codestral:22b-v0.1-f16 1.0

# 2. Ablate methods