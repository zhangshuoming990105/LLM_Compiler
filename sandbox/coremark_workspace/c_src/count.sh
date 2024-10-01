# for file *.ll, run count_llvm_ir_bb to count the number of basic blocks
# bash

for file in *.ll
do
    echo "counting $file"
    count_llvm_ir_bb $file
done
