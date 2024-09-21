	.file	"3_long_it1.c"
	.text
	.section	.rodata
.LC0:
	.string	"i = %d\n"
.LC1:
	.string	"j = %d\n"
.LC2:
	.string	"k = %d\n"
.LC3:
	.string	"l = %d\n"
.LC4:
	.string	"m = %d\n"
.LC5:
	.string	"n = %d\n"
.LC6:
	.string	"o = %d\n"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movl	$0, -28(%rbp)
	movl	$0, -24(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)

    # Initialize i to 0
    movl $0, -4(%rbp)          # i = 0

    # part1
.L_part1_for1_cond:
    # Compare i with 10
    cmpl $10, -4(%rbp)         # Compare i with 10
    jge .L_part1_for1_end     # If i >= 10, exit loop

.L_part1_for1_body:
    # j += i
    movl -8(%rbp), %eax        # Load j into %eax
    addl -4(%rbp), %eax        # Add i to %eax
    movl %eax, -8(%rbp)        # Store result back to j

    # k += j
    movl -12(%rbp), %eax       # Load k into %eax
    addl -8(%rbp), %eax        # Add j to %eax
    movl %eax, -12(%rbp)       # Store result back to k

    # l += k
    movl -16(%rbp), %eax       # Load l into %eax
    addl -12(%rbp), %eax       # Add k to %eax
    movl %eax, -16(%rbp)       # Store result back to l

    # m += l
    movl -20(%rbp), %eax       # Load m into %eax
    addl -16(%rbp), %eax       # Add l to %eax
    movl %eax, -20(%rbp)       # Store result back to m

    # n += m
    movl -24(%rbp), %eax       # Load n into %eax
    addl -20(%rbp), %eax       # Add m to %eax
    movl %eax, -24(%rbp)       # Store result back to n

    # o += n
    movl -28(%rbp), %eax       # Load o into %eax
    addl -24(%rbp), %eax       # Add n to %eax
    movl %eax, -28(%rbp)       # Store result back to o

    # Increment i by 1
    addl $1, -4(%rbp)          # i++

    jmp .L_part1_for1_cond   # Jump back to loop condition

.L_part1_for1_end:


    # Initialize j to 0
    movl $0, -8(%rbp)          # j = 0

.L_part2_for1_cond:
    # Compare j with 10
    cmpl $10, -8(%rbp)         # Compare j with 10
    jge .L_part2_for1_end     # If j >= 10, exit loop

.L_part2_for1_body:
    # k += j
    movl -12(%rbp), %eax       # Load k into %eax
    addl -8(%rbp), %eax        # Add j to %eax
    movl %eax, -12(%rbp)       # Store result back to k

    # l += k
    movl -16(%rbp), %eax       # Load l into %eax
    addl -12(%rbp), %eax       # Add k to %eax
    movl %eax, -16(%rbp)       # Store result back to l

    # m += l
    movl -20(%rbp), %eax       # Load m into %eax
    addl -16(%rbp), %eax       # Add l to %eax
    movl %eax, -20(%rbp)       # Store result back to m

    # n += m
    movl -24(%rbp), %eax       # Load n into %eax
    addl -20(%rbp), %eax       # Add m to %eax
    movl %eax, -24(%rbp)       # Store result back to n

    # o += n
    movl -28(%rbp), %eax       # Load o into %eax
    addl -24(%rbp), %eax       # Add n to %eax
    movl %eax, -28(%rbp)       # Store result back to o

    # Increment j by 1
    addl $1, -8(%rbp)          # j++

    jmp .L_part2_for1_cond   # Jump back to loop condition

.L_part2_for1_end:

    # Initialize k to 0
    movl $0, -12(%rbp)         # k = 0

.L_part3_for1_cond:
    # Compare k with 10
    cmpl $10, -12(%rbp)        # Compare k with 10
    jge .L_part3_for1_end     # If k >= 10, exit loop

.L_part3_for1_body:
    # l += k
    movl -16(%rbp), %eax       # Load l into %eax
    addl -12(%rbp), %eax       # Add k to %eax
    movl %eax, -16(%rbp)       # Store result back to l

    # m += l
    movl -20(%rbp), %eax       # Load m into %eax
    addl -16(%rbp), %eax       # Add l to %eax
    movl %eax, -20(%rbp)       # Store result back to m

    # n += m
    movl -24(%rbp), %eax       # Load n into %eax
    addl -20(%rbp), %eax       # Add m to %eax
    movl %eax, -24(%rbp)       # Store result back to n

    # o += n
    movl -28(%rbp), %eax       # Load o into %eax
    addl -24(%rbp), %eax       # Add n to %eax
    movl %eax, -28(%rbp)       # Store result back to o

    # Increment k by 1
    addl $1, -12(%rbp)         # k++

    jmp .L_part3_for1_cond   # Jump back to loop condition

.L_part3_for1_end:

    # Initialize l to 0
    movl $0, -16(%rbp)         # l = 0

.L_part4_for1_cond:
    # Compare l with 10
    cmpl $10, -16(%rbp)        # Compare l with 10
    jge .L_part4_for1_end     # If l >= 10, exit loop

.L_part4_for1_body:
    # m += l
    movl -20(%rbp), %eax       # Load m into %eax
    addl -16(%rbp), %eax       # Add l to %eax
    movl %eax, -20(%rbp)       # Store result back to m

    # n += m
    movl -24(%rbp), %eax       # Load n into %eax
    addl -20(%rbp), %eax       # Add m to %eax
    movl %eax, -24(%rbp)       # Store result back to n

    # o += n
    movl -28(%rbp), %eax       # Load o into %eax
    addl -24(%rbp), %eax       # Add n to %eax
    movl %eax, -28(%rbp)       # Store result back to o

    # Increment l by 1
    addl $1, -16(%rbp)         # l++

    jmp .L_part4_for1_cond   # Jump back to loop condition

.L_part4_for1_end:

    # Initialize m to 0
    movl $0, -20(%rbp)         # m = 0

.L_part4_for2_cond:
    # Compare m with 10
    cmpl $10, -20(%rbp)        # Compare m with 10
    jge .L_part4_for2_end     # If m >= 10, exit loop

.L_part4_for2_body:
    # n += m
    movl -24(%rbp), %eax       # Load n into %eax
    addl -20(%rbp), %eax       # Add m to %eax
    movl %eax, -24(%rbp)       # Store result back to n

    # o += n
    movl -28(%rbp), %eax       # Load o into %eax
    addl -24(%rbp), %eax       # Add n to %eax
    movl %eax, -28(%rbp)       # Store result back to o

    # Increment m by 1
    addl $1, -20(%rbp)         # m++

    jmp .L_part4_for2_cond   # Jump back to loop condition

.L_part4_for2_end:

    # Initialize n to 0
    movl $0, -24(%rbp)         # n = 0

.L_part4_for3_cond:
    # Compare n with 10
    cmpl $10, -24(%rbp)        # Compare n with 10
    jge .L_part4_for3_end     # If n >= 10, exit loop

.L_part4_for3_body:
    # o += n
    movl -28(%rbp), %eax       # Load o into %eax
    addl -24(%rbp), %eax       # Add n to %eax
    movl %eax, -28(%rbp)       # Store result back to o

    # Increment n by 1
    addl $1, -24(%rbp)         # n++

    jmp .L_part4_for3_cond   # Jump back to loop condition

.L_part4_for3_end:

    # Initialize o to 0
    movl $0, -28(%rbp)         # o = 0

.L_part4_for4_cond:
    # Compare o with 10
    cmpl $10, -28(%rbp)        # Compare o with 10
    jge .L_part4_for4_end     # If o >= 10, exit loop

.L_part4_for4_body:
    nop                        # Do nothing in the body of this loop

    # Increment o by 1
    addl $1, -28(%rbp)         # o++

    jmp .L_part4_for4_cond   # Jump back to loop condition

.L_part4_for4_end:
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT

	movl	-8(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT

	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT

	movl	-16(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT

	movl	-20(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT

	movl	-24(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT

	movl	-28(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT






	movl	$0, %eax
	leave
	ret
