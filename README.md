# LLM driven neural compilation toolchain

under development on ICT, CAS.

## Techniques

ChainofThought, Retrieval-Augmented Generation, etc.

## Workflow
            |>45-->
            |     |
    1|>2|>3 |>----|>8|>9
            |     |
            |>67-->

1. Input: pure C code
2. (Optional, LLM) Extract Method Refactoring, to make function shorter
3. (Optional, LLM) Variable Renaming(Scope solving)
4. (LLM) Variable Capturing
5. (symbolic) Stack Allocation, using the output in 4
6. (LLM) CFG Annotation
7. (symbolic) CFG Linearlization, using the output in 6
8. (LLM) Code generation, using the output in 3, 5, 7
9. Output: target assembly code

## Difficulties

1. Control flows
2. Variable bindings(both registers and stack)
3. Calling convention(ABI)
4. Long context
5. Floating-point values storage
6. Function signature inference


## tier 1: neural-symbolic compiler for c function to assembly
"""
Components:
1. general LLM
2.1 fine-tuned LLM for c-x86 translation
2.2 fine-tuned LLM for c-riscv translation
2.3 fine-tuned LLM for c-arm translation
3. stack allocator(symbolic)
4. cfg generator(symbolic)
5. 
"""
## neural-symbolic stack allocation for any c function
"""
1. neural:
input: c function
output: c function with renamed variables
2. neural:
input: c function
output: list of variables with type, size, alignment
3. symbolic:
input: list of variables with type, size, alignment
output: variable binding table that satisfy (non-overlapping, alignment) requirement
4. neural:
input: c function, variable binding table from 3
output: assembly code
"""