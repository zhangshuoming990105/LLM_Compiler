	.file	"vecadd.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	vecadd
	.type	vecadd, @function
vecadd:
	ble	a3,zero,.L10
	addi	a5,a1,4
	addi	a4,a0,4
	sub	a5,a2,a5
	sub	a4,a2,a4
	bgtu	a5,a4,.L14
.L4:
	csrr	a4,vlenb
	addi	a4,a4,-8
	bleu	a5,a4,.L3
.L5:
	vsetvli	a5,a3,e32,m1,ta,ma
	vle32.v	v1,0(a0)
	vle32.v	v2,0(a1)
	slli	a4,a5,2
	sub	a3,a3,a5
	add	a0,a0,a4
	add	a1,a1,a4
	vfadd.vv	v1,v1,v2
	vse32.v	v1,0(a2)
	add	a2,a2,a4
	bne	a3,zero,.L5
	ret
.L3:
	slli	a3,a3,2
	add	a3,a0,a3
.L7:
	flw	fa5,0(a0)
	flw	fa4,0(a1)
	addi	a0,a0,4
	addi	a1,a1,4
	fadd.s	fa5,fa5,fa4
	addi	a2,a2,4
	fsw	fa5,-4(a2)
	bne	a0,a3,.L7
.L10:
	ret
.L14:
	mv	a5,a4
	j	.L4
	.size	vecadd, .-vecadd
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC2:
	.string	"%f\n"
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	lui	a5,%hi(.LC1)
	vsetivli	zero,4,e32,m1,ta,ma
	addi	a5,a5,%lo(.LC1)
	vle32.v	v1,0(a5)
	addi	sp,sp,-48
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	ra,40(sp)
	mv	s0,sp
	vse32.v	v1,0(sp)
	lui	s1,%hi(.LC2)
.L16:
	flw	fa5,0(s0)
	addi	a0,s1,%lo(.LC2)
	addi	s0,s0,4
	fcvt.d.s	fa5,fa5
	fmv.x.d	a1,fa5
	call	printf
	addi	a5,sp,16
	bne	s0,a5,.L16
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	li	a0,0
	addi	sp,sp,48
	jr	ra
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align	4
.LC1:
	.word	1073741824
	.word	1082130432
	.word	1086324736
	.word	1090519040
	.ident	"GCC: (g04696df09) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
