	.file	"case.c"
	.text
# 1. Analyze custom types
# typedef struct {
#     int company_id;	// offset 0, size 4, [0, 4)
#     char company_name[10]; // offset 4, size 10, [4, 14)
# } Company;	// size 16(14+2 padding), align 4

# typedef struct {
#     int person_age;	// offset 0, size 4, [0, 4)
#     char person_name[10];	// offset 4, size 10, [4, 14), pad 2
#     long person_id;	// offset 16, size 8, [16, 24)
#     Company *person_company;	// offset 24, size 8, [24, 32)
# } Person;	// size 32 align 8

# 2. Collect all the constants
	.section	.rodata
.LC_print_person_name_str:
	.string	"person name: %s\n"
.LC_print_person_age_str:
	.string	"person age: %d\n"
.LC_print_person_id_str:
	.string	"person id: %ld\n"
.LC_print_person_company_id_str:
	.string	"person company id: %d\n"
.LC_print_person_comany_name_str:
	.string	"person company name: %s\n"
.LC_company_name:
	.string "Company A"
.LC_person_name:
	.string "Alice"

# 3. Compile the code
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	$10, -16(%rbp)
	movq	.LC_company_name(%rip), %rax
	movq	%rax, -12(%rbp)
	movw	$65, -4(%rbp)
	movl	$20, -48(%rbp)
	movq	.LC_person_name(%rip), %rax
	movq	%rax, -44(%rbp)
	movw	$0, -36(%rbp)
	movq	$10086, -32(%rbp)
	leaq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
	leaq	-48(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rsi
	leaq	.LC_print_person_name_str(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-48(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC_print_person_age_str(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC_print_person_id_str(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC_print_person_company_id_str(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-24(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rsi
	leaq	.LC_print_person_comany_name_str(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-48(%rbp), %eax
	addl	$5, %eax
	movl	%eax, -48(%rbp)
	movl	-16(%rbp), %eax
	subl	$5, %eax
	movl	%eax, -16(%rbp)
	movl	-48(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC_print_person_age_str(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC_print_person_company_id_str(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	ret
