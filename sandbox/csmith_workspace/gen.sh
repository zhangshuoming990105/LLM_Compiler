mkdir -p csmith_100
cd csmith_100
# gen 100 files
for i in {1..100}
do
    csmith --quiet --concise --no-pointers --no-volatile-pointers --no-builtins --no-volatiles --no-unions --no-checksum --no-jumps --no-bitfields --no-packed-struct --no-safe-math --no-global-variables --max-pointer-depth 1 --max-expr-complexity 2 --max-block-depth 3 --max-block-size 2 --max-funcs 1 > random$i.c
done