pipeline_prompts = [
    """[INST]Based on the C function program, generate another driver program that call this function in its main function.
And generate 10 inputs for this function, and print their results to stdout.
[/INST]
[INST]Example:
# Input Program:
```c
double percentage(double a, double b) {
    return a * 100.0 / b; 
}
```
# Driver Program:
```c
#include <stdio.h>
double percentage(double a, double b);
int main() {
  double a[10] = {10.0, 20.0, 30.0, 40.0, 50.0,
                  60.0, 70.0, 80.0, 90.0, 3.14159}; // 10 elements
  double b[10] = {100.0, 100.0, 100.0, 100.0, 100.0,
                  100.0, 100.0, 100.0, 100.0, -1000.0}; // 10 elements
  for (int i = 0; i < 10; i++) {
    printf("%d: percentage(%lf, %lf) = %lf\n", i, a[i], b[i],
           percentage(a[i], b[i]));
  }
  return 0;
}
```
[/INST]
# Real Input Program:
""",
    """[INST] #Goal# you are a professional AI assistant in code, based on the user input C code, 
you are going to help me to generate the corresponding x86 assembly step by step.
We can assume there will only be one function body to be compiled.[/INST]
[INST] #Format# C code will be inside "```c" and "```"tags, 
please also make sure the generated x86 assembly be inside "```x86" and "```" tags.[/INST]
[INST] Step1. First, we will rewrite the program, where each computation is performed by a temp variable. 
For example, spilt the computation of (n-m*i) into first compute temp0=m*i, then compute temp1=n-temp0. 
We may assign these temps by temp(%i) where i starts at 0.[/INST]
[INST]Example:
#Input:
```c
int func(int n, int m) {
    return n+m*10-1;
}
```
#Output:
```c
int func(int n, int m) {
    int temp0, temp1, temp2, temp3, temp4;
    temp0 = n;
    temp1 = m;
    temp2 = m* 10;
    temp3 = n + temp2;
    temp4 = temp3 - 1;
    return temp4;
}
```[/INST]
Now we will perform Step1.
#Input:
""",
    """[INST] Step2. We will rewrite the program again, to make the program to be in SSA form, 
where each variable is at most defined once, for continuous definition of value, 
we will create a new variable to replace it and its later usage, 
we will rename the variable x to x_{i} where i starts from 0, except the first variable, where we keep the original name. [/INST]
[INST]Example:
#Input:
```c
int func(int n) {
  n = n + 1;
  return n;
}
```
#Output:
```c
int func(int n) {
  int n_0;
  n_0 = n + 1;
  return n_0;
}
```[/INST]
Now we will perform Step2.
""",
    """[INST]Step3. Finally, we will translate the rewritten program into x86 assembly, 
where the translation is a mapping of temp variable to registers and non-temp variable into stack, 
we will generate the x86 assembly instructions line by line, think step by step, 
to make sure the assembly correctly reflects the original program.[/INST]
[INST]Example:
#Input:
```c
int main() {
    printf("Hello, World!\n");
    return 0;
}
```
#Output:
```x86
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	popq	%rbp
	ret
.LC0:
	.string	"Hello, World!"
```[/INST]
Now perform Step3, and get the final x86 assembly.""",
]
