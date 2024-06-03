# This file contains the prompts for the AI model to generate the x86 assembly code from the input C code.

# for mistral LLM, use [INST][/INST] to wrap the instruction prompt
prompts = {
    "general": """[INST]you are a helpful AI assistant, you will think carefully and follow the instructions to assist the user.[/INST]""",
    "mission": """[INST]you are a professional AI assistant in code, based on the following instructions, 
you are going to help me to generate the corresponding x86 assembly of input c code step by step.[/INST]
""",
    "step1": """[INST]#Step1# rename the variables with the same names but across different scopes.[/INST]
""",
    "step1_example": """[INST]#Step1Input:
```c
int x = 0;
int y = 10;
int foo() {
    return x;
}
int main() {
    int x = 10;
    int sum = y;
    for(int x = 0; x < 10; x++) {
        sum += x;
    }
    return x;
}
```
#Step1Output:
```c
int global_x = 0;
int global_y = 10;
int foo() {
    return global_x;
}
int main() {
    int x_0 = 10;
    int sum = global_y;
    for(int x_1 = 0; x_1 < 10; x_1++) {
        sum += x_1;
    }
    return x_0;
}
```[/INST]
""",
    "step2": """[INST]#Step2# generate a variable binding table output(in plaintext) from the Step1Output,
which binds each variable into a memory address in stack.
let's assume the target platform is x86 assembly. For each variable, 
1) we fill the item with: type, size, alignment, start index(l), end index(r), and we use (l, r] to represent the interval of the variable.
where l starts from 0, and keeps decreasing for new item. r == l - size, l == r + size.
new item's l is first set by last r, then we calculate new item's r by l - size.
such intervals will not overlap, but may not satisfy the alignment requirement.
2) then, we fix alignment, if x is not aligned, we shift (x-size, x] by subtract a value to make x to the multiple of alignment.
so each item is:
variable_name: type, size, alignment, (l, r], representation= r(%rbp)
[/INST]
""",
    "step2_example": """[INST]Example for #Step2#:
#Step2Input:
```c
int slice2(int total, int arr1[]) {
    int sum = 0;
    for(int i = 0; i < total; i++) {
        sum += arr1[i];
    }
    double *not_used = NULL;
    float not_used_2 = 0.0f;
    return sum;
}
```
#Step2Output:
```plaintext
## 1) type, size, alignment, (l, r](check if r % alignment==0), representation
total:  int, size 4, align 4, (0, -4], -4(%rbp)
arr1:  	int pointer, size 8, align 8, (-4, -12](12%8!=0), -12(%rbp)
sum:	int, size 4, align 4, (-12, -16], -16(%rbp)
i:  int, size 4, align 4, (-16, -20], -20(%rbp)
not_used:   double pointer, size 8, align 8, (-20, -28](28%8!=0), -28(%rbp)
not_used_2: float, size 4, align 4, (-28, -32], -32(%rbp)
## 2) fix alignment
total:  int, size 4, align 4, (0, -4], -4(%rbp)
arr1:   int pointer, size 8, align 8, (-8, -16], from (-4, -12]-4=(-8, -16], -16(%rbp)
sum:    int, size 4, align 4, (-16, -20], -20(%rbp)
i:  int, size 4, align 4, (-20, -24], -24(%rbp)
not_used:   double pointer, size 8, align 8, (-24, -32], -32(%rbp)
not_used_2: float, size 4, align 4, (-32, -36], -36(%rbp)
```
[/INST]
""",
    "step3": """[INST]#Step3# generate x86 assembly based on #Step1# and #Step2#'s outputs, 
the renamed source code and the variable binding table,
for each variable in the table: we get its memory address in stack from the table's representation,
The output assembly code should follow the AT&T syntax and uses explicit instruction operations,
like `movl` for 4-byte operations and `movq` for 8-byte operations. 
The code should be well-formatted and include annotations corresponding to the source code.[/INST]
""",
    "step3_example": """[INST]#Step1Output:
```c
float foo(int param_i, int param_j, int arr[]) {
    int sum = param_i;
    int temp = param_j;
    for(int i_1 = 0; i_1 < sum; i_1++) {
        for(int j_1 = 0; j_1 < sum; j_1++) {
            temp += arr[i_1] * arr[j_1];
        }
    }
    return temp;
}
```
#Step2Output:
```plaintext
## 1) type, size, alignment
param_i:  int, size 4, align 4, (0, -4], -4(%rbp)
param_j:  float, size 4, align 4, (-4, -8], -8(%rbp)
arr:    int array pointer, size 8, align 8, (-8, -16], -16(%rbp)
sum: int, size 4, align 4, (-16, -20], -20(%rbp)
temp: float, size 4, align 4, (-20, -24], -24(%rbp)
i_1: int, size 4, align 4, (-24, -28], -28(%rbp)
j_1: int, size 4, align 4, (-28, -32], -32(%rbp)
## 2) fix alignment(final)
param_i:  int, size 4, align 4, (0, -4], -4(%rbp)
param_j:  float, size 4, align 4, (-4, -8], -8(%rbp)
arr:    int array pointer, size 8, align 8, (-8, -16], -16(%rbp)
sum: int, size 4, align 4, (-16, -20], -20(%rbp)
temp: float, size 4, align 4, (-20, -24], -24(%rbp)
i_1: int, size 4, align 4, (-24, -28], -28(%rbp)
j_1: int, size 4, align 4, (-28, -32], -32(%rbp)
```
#FinalOutput:
```x86
    .text
    .globl  _foo
_foo:
    pushq    %rbp
    movq     %rsp, %rbp
    movl     %edi, -4(%rbp)     # param_i
    movss   %xmm0, -8(%rbp)    # param_j
    movq     %rsi, -16(%rbp)    # arr
    movl     -4(%rbp), %edi
    movl     %edi, -20(%rbp)    # sum = param_i
    cvttss2si   -8(%rbp), %edi
    movl     %edi, -24(%rbp)    # temp = param_j
    movl     $0, -28(%rbp)      # i_1 = 0
.L1:
    movl     -28(%rbp), %eax
    cmpl     -20(%rbp), %eax    # i_1 < sum
    jge     .L2
    movl     $0, -32(%rbp)      # j_1 = 0
.L3:
    movl     -32(%rbp), %eax
    cmpl     -20(%rbp), %eax    # j_1 < sum
    jge     .L4
    movq	-16(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx # arr[i_1]
	movq	-16(%rbp), %rax
	movslq	-32(%rbp), %rcx
	imull	(%rax,%rcx,4), %edx # arr[i_1] * arr[j_1]
	addl	-24(%rbp), %edx     
	movl	%edx, -24(%rbp)     # temp += arr[i_1] * arr[j_1]
    addl     $1, -32(%rbp)      # j_1++
    jmp     .L3
.L4:
    addl     $1, -28(%rbp)      # i_1++
    jmp     .L1
.L2:
    cvtsi2ssl   -24(%rbp), %xmm0   # return temp
    popq	%rbp
    retq
```
[/INST]
""",
    "recap": """[INST]Now, you will regard the user's input as the #Step1#'s #Input, and execute #Step1#,#Step2#,#Step3# step by step.
And finally get the x86 assembly we want as the output. Please perform the above steps now. Think carefully when doing each step.
The input will be marked with #Input[/INST]
""",
}
