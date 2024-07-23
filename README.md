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


## We will do multiple round query, and add extra round to solve errors based on execution.

## We can first judge the input code's complexity to choose the proper prompt to save tokens

## Further findings:

1. A new evaluation on LLM's understanding on code, especially C language and x86 assembly language:


2. LLM's key ability(through pretraining) to obtain high performance in such evaluation:
        # in C:
        A. ASCII: map a char 'xx' into its byte integer. where gpt-4o outperform others
        B. compute order, +-*/, etc.
        C. struct, union
        D. array
        # in x86:
        A. float, double
        B. control flow
        C. memory alignment
        D. stack caller/callee savings
        
3. by recording the compile/execute error, can the model fix the incorrectness?



# Thinking: What this work does?

1. Enabling LLM to compile on code through compiler-knowledge-guided steps design.
2. A first attempt and evaluation on most powerful LLMs on a vast low level code processing tasks,
including code compilation, assembly decompilation, code optimization and error fixing.
3. The above evaluation shows potential for LLMs to generate valid and correct unoptimized code,
through our steps design, we improve the behavioral accuracy on code compilation for C-x86 on ExeBench, from 60% to over 90%,
similar results for C-arm compilation.
however, when dealing with optimizations, LLMs are struggling. We report this as LLMs internal pitfalls,
including: arithemetic simplification, float value representation, and registers spilling.


# AddUp: More than forward compiler, also decompiler and code translator

Zero-Shot flexibility is the most advanced part comparing to SFT method
We can further utilize the LLM with RAG-based and tool-based methods. Like Llama-index.

# Finally, in this work, we contributes to:

- a methodology following the standard compilation pipeline to utilize foundation LLMs to achieve SOTA performance in neural code compilation, decompilation and translations.
- a Retrieval Augmented Generation framework that automatically utilizing external knowledge related to the translation itself, the framework further dramastically enhances the model's ability on non-pretrained languages.
- an automatic error-fixing mechanism to further improve the translation quality based on execution feedback.
- The evaluation of our work establishing a benchmark for LLMs in low level code understanding and capability in translations. We investigate advanced LLMs like GPT-4o, Claude-3.5-sonnet, Llama-3-70b, Mixtral-8x22b, and their older models, where a strong improvement trend is found and characterized.

# Takeaway and Findings: Foundation models can outperform SFTed models with advanced RAG support in low level code translation.

