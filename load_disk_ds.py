from datasets import load_from_disk, load_dataset, Dataset

# ds = load_dataset("mistral0105/exebench_io_validated_full_cleaned")["train"]
# print(ds.num_rows)
# ds.save_to_disk("datasets/exebench_io_validated_full_cleaned")

# ds2 = load_from_disk("datasets/exebench_io_validated_full_cleaned")
# print(ds2.num_rows)

# ds = load_dataset("mistral0105/exebench_io_hard2_full_cleaned")["train"]
# print(ds.num_rows)
# ds.save_to_disk("datasets/exebench_io_hard2_full_cleaned")

# ds2 = load_from_disk("datasets/exebench_io_hard2_full_cleaned")
# print(ds2.num_rows)

ds = load_dataset("mistral0105/CoreMark_FunctionLevel")["train"]
print(ds.num_rows)
ds.save_to_disk("datasets/CoreMark_FunctionLevel")

ds2 = load_from_disk("datasets/CoreMark_FunctionLevel")
print(ds2.num_rows)

