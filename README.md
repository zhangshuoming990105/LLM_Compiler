# LLM driven neural compilation toolchain

under development on ICT, CAS.

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
