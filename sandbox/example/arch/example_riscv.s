	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_c2p0"
	.file	"example.c"
	.globl	fib                             # -- Begin function fib
	.p2align	1
	.type	fib,@function
fib:                                    # @fib
# %bb.0:
	addi	sp, sp, -32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	addi	s0, sp, 32
                                        # kill: def $x11 killed $x10
	sw	a0, -24(s0)
	lw	a1, -24(s0)
	li	a0, 1
	blt	a0, a1, .LBB0_2
	j	.LBB0_1
.LBB0_1:
	lw	a0, -24(s0)
	sw	a0, -20(s0)
	j	.LBB0_3
.LBB0_2:
	lw	a0, -24(s0)
	addiw	a0, a0, -1
	call	fib
	sd	a0, -32(s0)                     # 8-byte Folded Spill
	lw	a0, -24(s0)
	addiw	a0, a0, -2
	call	fib
	mv	a1, a0
	ld	a0, -32(s0)                     # 8-byte Folded Reload
	addw	a0, a0, a1
	sw	a0, -20(s0)
	j	.LBB0_3
.LBB0_3:
	lw	a0, -20(s0)
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	fib, .Lfunc_end0-fib
                                        # -- End function
	.ident	"Homebrew clang version 18.1.5"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym fib
