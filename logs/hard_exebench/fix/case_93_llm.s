
	.text
	.globl	ySinTable
	.type	ySinTable, @function
ySinTable:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -20(%rbp)
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.L2
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L2:
	cmpl	$1, -20(%rbp)
	jne	.L4
	movsd	.LC2(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L4:
	cmpl	$2, -20(%rbp)
	jne	.L5
	movsd	.LC3(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L5:
	cmpl	$3, -20(%rbp)
	jne	.L6
	movsd	.LC4(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L6:
	cmpl	$4, -20(%rbp)
	jne	.L7
	movsd	.LC5(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L7:
	cmpl	$5, -20(%rbp)
	jne	.L8
	movsd	.LC6(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L8:
	cmpl	$6, -20(%rbp)
	jne	.L9
	movsd	.LC7(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L9:
	cmpl	$7, -20(%rbp)
	jne	.L10
	movsd	.LC8(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L10:
	cmpl	$8, -20(%rbp)
	jne	.L11
	movsd	.LC9(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L11:
	cmpl	$9, -20(%rbp)
	jne	.L12
	movsd	.LC10(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L12:
	cmpl	$10, -20(%rbp)
	jne	.L13
	movsd	.LC11(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L13:
	cmpl	$11, -20(%rbp)
	jne	.L14
	movsd	.LC12(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L14:
	cmpl	$12, -20(%rbp)
	jne	.L15
	movsd	.LC13(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L15:
	cmpl	$13, -20(%rbp)
	jne	.L16
	movsd	.LC14(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L16:
	cmpl	$14, -20(%rbp)
	jne	.L17
	movsd	.LC15(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L17:
	cmpl	$15, -20(%rbp)
	jne	.L18
	movsd	.LC16(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L18:
	cmpl	$16, -20(%rbp)
	jne	.L19
	movsd	.LC17(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L19:
	cmpl	$17, -20(%rbp)
	jne	.L20
	movsd	.LC18(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L20:
	cmpl	$18, -20(%rbp)
	jne	.L21
	movsd	.LC19(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L21:
	cmpl	$19, -20(%rbp)
	jne	.L22
	movsd	.LC20(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L22:
	cmpl	$20, -20(%rbp)
	jne	.L23
	movsd	.LC21(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L23:
	cmpl	$21, -20(%rbp)
	jne	.L24
	movsd	.LC22(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L24:
	cmpl	$22, -20(%rbp)
	jne	.L25
	movsd	.LC23(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L25:
	cmpl	$23, -20(%rbp)
	jne	.L26
	movsd	.LC24(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L26:
	cmpl	$24, -20(%rbp)
	jne	.L27
	movsd	.LC25(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L27:
	cmpl	$25, -20(%rbp)
	jne	.L28
	movsd	.LC26(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L28:
	cmpl	$26, -20(%rbp)
	jne	.L29
	movsd	.LC27(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L29:
	cmpl	$27, -20(%rbp)
	jne	.L30
	movsd	.LC28(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L30:
	cmpl	$28, -20(%rbp)
	jne	.L31
	movsd	.LC29(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L31:
	cmpl	$29, -20(%rbp)
	jne	.L32
	movsd	.LC30(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L32:
	cmpl	$30, -20(%rbp)
	jne	.L33
	movsd	.LC31(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L33:
	cmpl	$31, -20(%rbp)
	jne	.L34
	movsd	.LC32(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L34:
	cmpl	$32, -20(%rbp)
	jne	.L35
	movsd	.LC33(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L35:
	cmpl	$33, -20(%rbp)
	jne	.L36
	movsd	.LC34(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L36:
	cmpl	$34, -20(%rbp)
	jne	.L37
	movsd	.LC35(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L37:
	cmpl	$35, -20(%rbp)
	jne	.L38
	movsd	.LC36(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L38:
	cmpl	$36, -20(%rbp)
	jne	.L39
	movsd	.LC37(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L39:
	cmpl	$37, -20(%rbp)
	jne	.L40
	movsd	.LC38(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L40:
	cmpl	$38, -20(%rbp)
	jne	.L41
	movsd	.LC39(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L41:
	cmpl	$39, -20(%rbp)
	jne	.L42
	movsd	.LC40(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L42:
	cmpl	$40, -20(%rbp)
	jne	.L43
	movsd	.LC41(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L43:
	cmpl	$41, -20(%rbp)
	jne	.L44
	movsd	.LC42(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L44:
	cmpl	$42, -20(%rbp)
	jne	.L45
	movsd	.LC43(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L45:
	cmpl	$43, -20(%rbp)
	jne	.L46
	movsd	.LC44(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L46:
	cmpl	$44, -20(%rbp)
	jne	.L47
	movsd	.LC45(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L47:
	cmpl	$45, -20(%rbp)
	jne	.L48
	movsd	.LC46(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L48:
	cmpl	$46, -20(%rbp)
	jne	.L49
	movsd	.LC47(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L49:
	cmpl	$47, -20(%rbp)
	jne	.L50
	movsd	.LC48(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L50:
	cmpl	$48, -20(%rbp)
	jne	.L51
	movsd	.LC49(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L51:
	cmpl	$49, -20(%rbp)
	jne	.L52
	movsd	.LC50(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L52:
	cmpl	$50, -20(%rbp)
	jne	.L53
	movsd	.LC51(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L53:
	cmpl	$51, -20(%rbp)
	jne	.L54
	movsd	.LC52(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L54:
	cmpl	$52, -20(%rbp)
	jne	.L55
	movsd	.LC53(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L55:
	cmpl	$53, -20(%rbp)
	jne	.L56
	movsd	.LC54(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L56:
	cmpl	$54, -20(%rbp)
	jne	.L57
	movsd	.LC55(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L57:
	cmpl	$55, -20(%rbp)
	jne	.L58
	movsd	.LC56(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L58:
	cmpl	$56, -20(%rbp)
	jne	.L59
	movsd	.LC57(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L59:
	cmpl	$57, -20(%rbp)
	jne	.L60
	movsd	.LC58(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L60:
	cmpl	$58, -20(%rbp)
	jne	.L61
	movsd	.LC59(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L61:
	cmpl	$59, -20(%rbp)
	jne	.L62
	movsd	.LC60(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L62:
	cmpl	$60, -20(%rbp)
	jne	.L63
	movsd	.LC61(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L63:
	cmpl	$61, -20(%rbp)
	jne	.L64
	movsd	.LC62(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
