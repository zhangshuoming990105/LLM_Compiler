from datetime import datetime
import os

import torch
from peft import (
    PeftModel,
    LoraConfig,
    get_peft_model,
)
from transformers import (
    AutoTokenizer,
    AutoModelForCausalLM,
    LlamaForCausalLM,
    TrainingArguments,
    Trainer,
    DataCollatorForSeq2Seq,
)
from datasets import load_dataset
import wandb
from dataclasses import dataclass


@dataclass
class CompilerLoraConfig:
    # compiler config
    src_language: str = "c"
    tgt_language: str = "x86"
    opt_level: str = "O0"
    corpus: str = "zhangshuoming/c_x86_O0_exebench_json_cleaned"
    max_length: int = 2048
    # lora config
    r: int = 128 # 128, 64, 32
    lora_alpha: int = 32
    lora_dropout: float = 0 # do we need dropout?
    bias: str = "none"

    base_model: str = "codellama/CodeLlama-13b-Instruct-hf"
    base_model_name: str = "CodeLlama-13b-Instruct-hf"

    # base_model: str = "daryl149/llama-2-7b-chat-hf"
    # base_model_name: str = "llama-2-7b-chat-hf"


    # train config
    batch_size: int = 16
    per_device_train_batch_size: int = 4
    gradient_accumulation_steps: int = batch_size // per_device_train_batch_size
    num_train_epochs: int = 1
    warmup_steps: int = 5000
    learning_rate: float = 1e-4
    lr_scheduler_type: str = "cosine_with_restarts"
    fp16: bool = True
    fp16_opt_level: str = "O1"
    logging_steps: int = 100
    optim: str = "adamw_torch"
    evaluation_strategy: str = "steps"
    save_strategy: str = "steps"
    eval_steps: int = 10000
    save_steps: int = 5000
    save_total_limit: int = 20


def set_llvm_config(config: CompilerLoraConfig):
    config.src_language = "c"
    config.tgt_language = "llvm"
    config.corpus = "zhangshuoming/c_llvm_O0_exebench_json_cleaned"


def set_x86_config_deprecated(config: CompilerLoraConfig):
    config.src_language = "c"
    config.tgt_language = "x86"
    config.corpus = "zhangshuoming/c_x86_exebench_json_cleaned"


def set_x86_config(config: CompilerLoraConfig):
    config.src_language = "c"
    config.tgt_language = "x86"
    # legacy setting for codellama13b, baseline
    # config.corpus = "zhangshuoming/c_x86_O0_exebench_json_cleaned"
    
    # setting1: codellama13b, baseline
    # config.corpus = "mistral0105/emnlp_baseline_train_ds_for_codellama"
    
    # setting2: deepseekcoder, baseline
    config.corpus = "mistral0105/emnlp_baseline_train_ds_for_deepseekcoder"
    
    # setting3: codellama13b, augmented
    # config.corpus = "mistral0105/emnlp_augmented_train_ds_for_codellama"
    
    # setting4: deepseekcoder, augmented
    # config.corpus = "mistral0105/emnlp_augmented_train_ds_for_deepseekcoder"
    
    
    

def set_disassemble_config(config: CompilerLoraConfig):
    config.src_language = "x86"
    config.tgt_language = "c"
    config.corpus = "zhangshuoming/x86_c_O0_exebench_json_cleaned"


# default setting is train x86_O0
if __name__ == "__main__":
    config = CompilerLoraConfig()
    # set_llvm_config(config)
    set_x86_config(config)
    # first, use a small dataset to test the code
    config.base_model = "deepseek-ai/DeepSeek-Coder-V2-Lite-Instruct"
    config.base_model_name = "DeepSeek-Coder-V2-Lite-Instruct"
    config.learning_rate = 5e-5
    config.warmup_steps = 1000
    config.eval_steps = 2000
    config.save_steps = 1000
    config.save_total_limit = 5
    
    
    print(config)
    corpus = load_dataset(config.corpus, split="train")
    small_dataset = corpus.train_test_split(0.05, 0.95, True)
    # a real small subset out of the dataset(5% -> 0.25%, 4.75%)
    # small_dataset = small_dataset["test"].train_test_split(0.05, 0.95, True)
    train_dataset = small_dataset["train"]
    eval_dataset = small_dataset["test"]
    print(train_dataset.shape)
    print(eval_dataset.shape)
    base_model = config.base_model
    model = AutoModelForCausalLM.from_pretrained(
        base_model, torch_dtype=torch.float16, device_map="auto", trust_remote_code=True
    )
    tokenizer = AutoTokenizer.from_pretrained(base_model, use_fast=True, trust_remote_code=True)
    # finetuning script
    # tokenizer.add_eos_token = True
    # tokenizer.pad_token_id = 2
    # tokenizer.padding_side = "left"

    def tokenize(prompt):
        result = tokenizer(
            prompt,
            truncation=True,
            max_length=config.max_length,
            padding=False,
            return_tensors=None,
        )

        # "self-supervised learning" means the labels are also the inputs:
        result["labels"] = result["input_ids"].copy()

        return result

    def generate_and_tokenize_prompt(data_point):
        text = data_point["text"]
        full_prompt = f"""{text}
    """
        return tokenize(full_prompt)

    tokenized_train_dataset = train_dataset.map(
        generate_and_tokenize_prompt,
        cache_file_name=f".cache/tokenized_train_{config.src_language}_{config.tgt_language}_{config.opt_level}_{config.base_model_name}",
    )
    tokenized_val_dataset = eval_dataset.map(
        generate_and_tokenize_prompt,
        cache_file_name=f".cache/tokenized_eval_{config.src_language}_{config.tgt_language}_{config.opt_level}_{config.base_model_name}",
    )
    print("tokenize dataset done.")
    model.train()  # put model back into training mode

    lora_config = LoraConfig(
        r=config.r,
        lora_alpha=config.lora_alpha,
        target_modules=["q_proj", "k_proj", "v_proj", "o_proj"],
        lora_dropout=config.lora_dropout,
        bias=config.bias,
        task_type="CAUSAL_LM",
    )
    model = get_peft_model(model, lora_config)
    model.print_trainable_parameters()
    wandb_project = f"{config.base_model_name}_{config.src_language}_{config.tgt_language}_{config.opt_level}_lora{config.r}_{config.lora_alpha}_{config.lora_dropout}_{config.bias}"
    if len(wandb_project) > 0:
        os.environ["WANDB_PROJECT"] = wandb_project

    if torch.cuda.device_count() > 1:
        # keeps Trainer from trying its own DataParallelism when more than 1 gpu is available
        model.is_parallelizable = True
        model.model_parallel = True
    output_name = f"{wandb_project}_b{config.batch_size}_gpu{config.batch_size//config.per_device_train_batch_size}"
    output_dir = "peft_trainer/lora_adapters/" + output_name

    training_args = TrainingArguments(
        per_device_train_batch_size=config.per_device_train_batch_size,
        gradient_accumulation_steps=config.gradient_accumulation_steps,
        # per_device_eval_batch_size=per_device_train_batch_size,
        # eval_accumulation_steps=gradient_accumulation_steps,
        num_train_epochs=config.num_train_epochs,
        warmup_steps=config.warmup_steps,
        learning_rate=config.learning_rate,
        lr_scheduler_type=config.lr_scheduler_type,
        fp16=config.fp16,
        fp16_opt_level=config.fp16_opt_level,
        logging_steps=config.logging_steps,
        optim=config.optim,
        evaluation_strategy=config.evaluation_strategy,
        save_strategy=config.save_strategy,
        eval_steps=config.eval_steps,
        save_steps=config.save_steps,
        output_dir=output_dir,
        save_total_limit=config.save_total_limit,
        group_by_length=False,  # group sequences of roughly the same length together to speed up training
        hub_strategy="checkpoint",
        report_to="wandb",
        run_name=f"{config.base_model_name}-{datetime.now().strftime('%Y-%m-%d-%H-%M')}",
    )

    trainer = Trainer(
        model=model,
        train_dataset=tokenized_train_dataset,
        eval_dataset=tokenized_val_dataset,
        args=training_args,
        data_collator=DataCollatorForSeq2Seq(
            tokenizer, pad_to_multiple_of=8, return_tensors="pt", padding=True
        ),
    )

    model.config.use_cache = False

    print("compiling the model")
    model = torch.compile(model)
    trainer.train(
        # resume_from_checkpoint="""
    )
    output_dir = os.path.join(output_dir, "final_checkpoint")
    trainer.model.save_pretrained(output_dir)
    print("train done")

    # inference using the adapters
    # adapter_name = output_dir
    # model = AutoModelForCausalLM.from_pretrained(base_model)
    # model = PeftModel.from_pretrained(model, adapter_name)
    # tokenizer = AutoTokenizer.from_pretrained(base_model)
    
    # merge models
    # adapter_name = output_dir
    # save_path = f"models/merged_{output_name}"
    # model = LlamaForCausalLM.from_pretrained(
    #     base_model, torch_dtype=torch.float16, device_map="auto"
    # )
    # tokenizer = AutoTokenizer.from_pretrained(base_model)
    # model = PeftModel.from_pretrained(model, adapter_name)
    # model = model.merge_and_unload()
    # tokenizer.save_pretrained(save_path)
    # model.save_pretrained(save_path)
    # print("save done")
