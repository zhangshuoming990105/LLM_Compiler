
	.text
	.globl	interp_weno7
	.type	interp_weno7, @function
interp_weno7:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$480, %rsp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	%xmm2, -24(%rbp)
	movsd	%xmm3, -32(%rbp)
	movsd	%xmm4, -40(%rbp)
	movsd	%xmm5, -48(%rbp)
	movsd	%xmm6, -56(%rbp)

	# Calculate p0
	movsd	-8(%rbp), %xmm0
	movsd	.LC0(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	-16(%rbp), %xmm1
	movsd	.LC1(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	-24(%rbp), %xmm1
	movsd	.LC2(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	-32(%rbp), %xmm1
	movsd	.LC3(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -64(%rbp)

	# Calculate p1
	movsd	-16(%rbp), %xmm0
	movsd	.LC4(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	-24(%rbp), %xmm1
	movsd	.LC5(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	-32(%rbp), %xmm1
	movsd	.LC6(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	-40(%rbp), %xmm1
	movsd	.LC7(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -72(%rbp)

	# Calculate p2
	movsd	-24(%rbp), %xmm0
	movsd	.LC8(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	-32(%rbp), %xmm1
	movsd	.LC9(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	-40(%rbp), %xmm1
	movsd	.LC10(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	-48(%rbp), %xmm1
	movsd	.LC11(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -80(%rbp)

	# Calculate p3
	movsd	-32(%rbp), %xmm0
	movsd	.LC12(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	-40(%rbp), %xmm1
	movsd	.LC13(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	-48(%rbp), %xmm1
	movsd	.LC14(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	-56(%rbp), %xmm1
	movsd	.LC15(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -88(%rbp)

	# Calculate beta0
	movsd	-8(%rbp), %xmm0
	movsd	.LC16(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	-16(%rbp), %xmm1
	movsd	.LC17(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	-24(%rbp), %xmm1
	movsd	.LC18(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	-32(%rbp), %xmm1
	movsd	.LC19(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)

	# Calculate beta1
	movsd	-16(%rbp), %xmm0
	movsd	.LC20(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	-24(%rbp), %xmm1
	movsd	.LC21(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	-32(%rbp), %xmm1
	movsd	.LC22(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	-40(%rbp), %xmm1
	movsd	.LC23(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -104(%rbp)

	# Calculate beta2
	movsd	-24(%rbp), %xmm0
	movsd	.LC24(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	-32(%rbp), %xmm1
	movsd	.LC25(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	-40(%rbp), %xmm1
	movsd	.LC26(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	-48(%rbp), %xmm1
	movsd	.LC27(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -112(%rbp)

	# Calculate beta3
	movsd	-32(%rbp), %xmm0
	movsd	.LC28(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	-40(%rbp), %xmm1
	movsd	.LC29(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	-48(%rbp), %xmm1
	movsd	.LC30(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	-56(%rbp), %xmm1
	movsd	.LC31(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -120(%rbp)

	# Calculate alpha0
	movsd	.LC32(%rip), %xmm0
	movsd	-96(%rbp), %xmm1
	addsd	.LC33(%rip), %xmm1
	mulsd	%xmm1, %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -128(%rbp)

	# Calculate alpha1
	movsd	.LC34(%rip), %xmm0
	movsd	-104(%rbp), %xmm1
	addsd	.LC33(%rip), %xmm1
	mulsd	%xmm1, %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -136(%rbp)

	# Calculate alpha2
	movsd	.LC35(%rip), %xmm0
	movsd	-112(%rbp), %xmm1
	addsd	.LC33(%rip), %xmm1
	mulsd	%xmm1, %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -144(%rbp)

	# Calculate alpha3
	movsd	.LC36(%rip), %xmm0
	movsd	-120(%rbp), %xmm1
	addsd	.LC33(%rip), %xmm1
	mulsd	%xmm1, %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -152(%rbp)

	# Calculate alpha_sum_inv
	movsd	-128(%rbp), %xmm0
	addsd	-136(%rbp), %xmm0
	addsd	-144(%rbp), %xmm0
	addsd	-152(%rbp), %xmm0
	movsd	.LC37(%rip), %xmm1
	divsd	%xmm0, %xmm1
	movsd	%xmm1, -160(%rbp)

	# Calculate w0
	movsd	-128(%rbp), %xmm0
	mulsd	-160(%rbp), %xmm0
	movsd	%xmm0, -168(%rbp)

	# Calculate w1
	movsd	-136(%rbp), %xmm0
	mulsd	-160(%rbp), %xmm0
	movsd	%xmm0, -176(%rbp)

	# Calculate w2
	movsd	-144(%rbp), %xmm0
	mulsd	-160(%rbp), %xmm0
	movsd	%xmm0, -184(%rbp)

	# Calculate w3
	movsd	-152(%rbp), %xmm0
	mulsd	-160(%rbp), %xmm0
	movsd	%xmm0, -192(%rbp)

	# Calculate final result
	movsd	-168(%rbp), %xmm0
	mulsd	-64(%rbp), %xmm0
	movsd	-176(%rbp), %xmm1
	mulsd	-72(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	-184(%rbp), %xmm1
	mulsd	-80(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	-192(%rbp), %xmm1
	mulsd	-88(%rbp), %xmm1
	addsd	%xmm1, %xmm0

	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leave
	ret

	.section	.rodata
.LC0:
	.long	3221225472
	.long	1071644672
.LC1:
	.long	0
	.long	1074790400
.LC2:
	.long	3229614080
	.long	1074790400
.LC3:
	.long	1074790400
	.long	1074790400
.LC4:
	.long	0
	.long	1071644672
.LC5:
	.long	3229614080
	.long	1071644672
.LC6:
	.long	0
	.long	1074790400
.LC7:
	.long	3221225472
	.long	1071644672
.LC8:
	.long	3221225472
	.long	1071644672
.LC9:
	.long	0
	.long	1074790400
.LC10:
	.long	0
	.long	1074790400
.LC11:
	.long	3221225472
	.long	1071644672
.LC12:
	.long	3221225472
	.long	1071644672
.LC13:
	.long	0
	.long	1074790400
.LC14:
	.long	3229614080
	.long	1071644672
.LC15:
	.long	0
	.long	1071644672
.LC16:
	.long	3221225472
	.long	1071644672
.LC17:
	.long	0
	.long	1074790400
.LC18:
	.long	3229614080
	.long	1071644672
.LC19:
	.long	1074790400
	.long	1074790400
.LC20:
	.long	0
	.long	1071644672
.LC21:
	.long	3229614080
	.long	1071644672
.LC22:
	.long	0
	.long	1074790400
.LC23:
	.long	3221225472
	.long	1071644672
.LC24:
	.long	3221225472
	.long	1071644672
.LC25:
	.long	3229614080
	.long	1071644672
.LC26:
	.long	0
	.long	1074790400
.LC27:
	.long	3221225472
	.long	1071644672
.LC28:
	.long	3221225472
	.long	1071644672
.LC29:
	.long	0
	.long	1074790400
.LC30:
	.long	3229614080
	.long	1071644672
.LC31:
	.long	1074790400
	.long	1074790400
.LC32:
	.long	0
	.long	1071644672
.LC33:
	.long	0
	.long	1072693248
.LC34:
	.long	0
	.long	1074790400
.LC35:
	.long	0
	.long	1075838976
.LC36:
	.long	0
	.long	1073
.LC