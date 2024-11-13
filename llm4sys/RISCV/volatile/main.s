	.file	"main.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	vector_add
	.type	vector_add, @function
vector_add:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	sd	a2,-56(s0)
	mv	a5,a3
	sw	a5,-60(s0)
	sw	zero,-20(s0)
	j	.L2
.L3:
	lw	a5,-60(s0)
	mv	a4,a5
	lw	a5,-20(s0)
	subw	a5,a4,a5
	sext.w	a2,a5
	ld	a3,-40(s0)
	ld	a4,-48(s0)
	ld	a5,-56(s0)
 #APP
# 18 "main.c" 1
	vsetvli t0, a3, e32, m1, ta, ma
	vle32.v v0, (a4)
	vle32.v v1, (a5)
	vfadd.vv v2, v0, v1
	vse32.v v2, (a3)
	
# 0 "" 2
 #NO_APP
	sd	a3,-40(s0)
	sd	a4,-48(s0)
	sd	a5,-56(s0)
	ld	a5,-40(s0)
	addi	a5,a5,16
	sd	a5,-40(s0)
	ld	a5,-48(s0)
	addi	a5,a5,16
	sd	a5,-48(s0)
	ld	a5,-56(s0)
	addi	a5,a5,16
	sd	a5,-56(s0)
	lw	a5,-20(s0)
	addiw	a5,a5,4
	sw	a5,-20(s0)
.L2:
	lw	a5,-20(s0)
	mv	a4,a5
	lw	a5,-60(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L3
	nop
	nop
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	vector_add, .-vector_add
	.section	.rodata
	.align	3
.LC0:
	.string	"%.2f "
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	li	a5,16
	sw	a5,-28(s0)
	lw	a5,-28(s0)
	slli	a5,a5,2
	mv	a0,a5
	call	malloc
	mv	a5,a0
	sd	a5,-40(s0)
	lw	a5,-28(s0)
	slli	a5,a5,2
	mv	a0,a5
	call	malloc
	mv	a5,a0
	sd	a5,-48(s0)
	lw	a5,-28(s0)
	slli	a5,a5,2
	mv	a0,a5
	call	malloc
	mv	a5,a0
	sd	a5,-56(s0)
	sw	zero,-20(s0)
	j	.L5
.L6:
	lw	a5,-20(s0)
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a5,a4,a5
	lw	a4,-20(s0)
	fcvt.s.w	fa5,a4
	fsw	fa5,0(a5)
	lw	a5,-20(s0)
	slliw	a5,a5,1
	sext.w	a4,a5
	lw	a5,-20(s0)
	slli	a5,a5,2
	ld	a3,-48(s0)
	add	a5,a3,a5
	fcvt.s.w	fa5,a4
	fsw	fa5,0(a5)
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L5:
	lw	a5,-20(s0)
	mv	a4,a5
	lw	a5,-28(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L6
	lw	a5,-28(s0)
	mv	a3,a5
	ld	a2,-48(s0)
	ld	a1,-40(s0)
	ld	a0,-56(s0)
	call	vector_add
	sw	zero,-24(s0)
	j	.L7
.L8:
	lw	a5,-24(s0)
	slli	a5,a5,2
	ld	a4,-56(s0)
	add	a5,a4,a5
	flw	fa5,0(a5)
	fcvt.d.s	fa5,fa5
	fmv.x.d	a1,fa5
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L7:
	lw	a5,-24(s0)
	mv	a4,a5
	lw	a5,-28(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L8
	li	a0,10
	call	putchar
	ld	a0,-40(s0)
	call	free
	ld	a0,-48(s0)
	call	free
	ld	a0,-56(s0)
	call	free
	li	a5,0
	mv	a0,a5
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	main, .-main
	.ident	"GCC: (g04696df09) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
