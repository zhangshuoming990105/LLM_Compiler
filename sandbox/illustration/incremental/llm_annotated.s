	.file	"case.c"
	.text
# Struct definitions:
# Company {
#     int company_id;        // offset 0, size 4
#     char company_name[10]; // offset 4, size 10
# }; // total size 16 (14 + 2 padding), aligned to 4 bytes

# Person {
#     int person_age;        // offset 0, size 4
#     char person_name[10];  // offset 4, size 10
#     long person_id;        // offset 16, size 8
#     Company *person_company; // offset 24, size 8
# }; // total size 32, aligned to 8 bytes

# String constants
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

	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp

    # Initialize Company struct
	movl	$10, -16(%rbp)           # company.company_id = 10
	movq	.LC_company_name(%rip), %rax
	movq	%rax, -12(%rbp)          # Copy "Company A" to company.company_name
	movw	$65, -4(%rbp)            # Null-terminate company.company_name

    # Initialize Person struct
	movl	$20, -48(%rbp)           # person.person_age = 20
	movq	.LC_person_name(%rip), %rax
	movq	%rax, -44(%rbp)          # Copy "Alice" to person.person_name
	movw	$0, -36(%rbp)            # Null-terminate person.person_name
	movq	$10086, -32(%rbp)        # person.person_id = 10086
	leaq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)          # person.person_company = &company

    # printf("person name: %s\n", person.person_name);
	leaq	-48(%rbp), %rax
	addq	$4, %rax                 # Calculate address of person.person_name
	movq	%rax, %rsi
	leaq	.LC_print_person_name_str(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT

    # printf("person age: %d\n", person.person_age);
	movl	-48(%rbp), %eax          # Load person.person_age
	movl	%eax, %esi
	leaq	.LC_print_person_age_str(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT

    # printf("person id: %ld\n", person.person_id);
	movq	-32(%rbp), %rax          # Load person.person_id
	movq	%rax, %rsi
	leaq	.LC_print_person_id_str(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT

    # printf("person company id: %d\n", person.person_company->company_id);
	movq	-24(%rbp), %rax          # Load person.person_company
	movl	(%rax), %eax             # Load company_id
	movl	%eax, %esi
	leaq	.LC_print_person_company_id_str(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT

    # printf("person company name: %s\n", person.person_company->company_name);
	movq	-24(%rbp), %rax          # Load person.person_company
	addq	$4, %rax                 # Calculate address of company_name
	movq	%rax, %rsi
	leaq	.LC_print_person_comany_name_str(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT

    # person.person_age += 5;
	movl	-48(%rbp), %eax
	addl	$5, %eax
	movl	%eax, -48(%rbp)

    # company.company_id -= 5;
	movl	-16(%rbp), %eax
	subl	$5, %eax
	movl	%eax, -16(%rbp)

    # printf("person age: %d\n", person.person_age);
	movl	-48(%rbp), %eax          # Load updated person.person_age
	movl	%eax, %esi
	leaq	.LC_print_person_age_str(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT

    # printf("person company id: %d\n", person.person_company->company_id);
	movq	-24(%rbp), %rax          # Load person.person_company
	movl	(%rax), %eax             # Load updated company_id
	movl	%eax, %esi
	leaq	.LC_print_person_company_id_str(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT

    # return 0;
	movl	$0, %eax
	leave
	ret