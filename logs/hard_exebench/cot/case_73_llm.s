
    .text
    .globl  ySinTable
    .type   ySinTable, @function
ySinTable:
.LFB0:
    # Prologue
    endbr64
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp

    # Initialize result to 0.0
    movsd   .LC_1_000000(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)

    # Compare details with 0
    cmpl    $0, %edi
    je      .L_details_0

    # Compare details with 1
    cmpl    $1, %edi
    je      .L_details_1

    # Compare details with 2
    cmpl    $2, %edi
    je      .L_details_2

    # Compare details with 3
    cmpl    $3, %edi
    je      .L_details_3

    # Compare details with 4
    cmpl    $4, %edi
    je      .L_details_4

    # Compare details with 5
    cmpl    $5, %edi
    je      .L_details_5

    # Compare details with 6
    cmpl    $6, %edi
    je      .L_details_6

    # Compare details with 7
    cmpl    $7, %edi
    je      .L_details_7

    # Compare details with 8
    cmpl    $8, %edi
    je      .L_details_8

    # Compare details with 9
    cmpl    $9, %edi
    je      .L_details_9

    # Compare details with 10
    cmpl    $10, %edi
    je      .L_details_10

    # Compare details with 11
    cmpl    $11, %edi
    je      .L_details_11

    # Compare details with 12
    cmpl    $12, %edi
    je      .L_details_12

    # Compare details with 13
    cmpl    $13, %edi
    je      .L_details_13

    # Compare details with 14
    cmpl    $14, %edi
    je      .L_details_14

    # Compare details with 15
    cmpl    $15, %edi
    je      .L_details_15

    # Compare details with 16
    cmpl    $16, %edi
    je      .L_details_16

    # Compare details with 17
    cmpl    $17, %edi
    je      .L_details_17

    # Compare details with 18
    cmpl    $18, %edi
    je      .L_details_18

    # Compare details with 19
    cmpl    $19, %edi
    je      .L_details_19

    # Compare details with 20
    cmpl    $20, %edi
    je      .L_details_20

    # Compare details with 21
    cmpl    $21, %edi
    je      .L_details_21

    # Compare details with 22
    cmpl    $22, %edi
    je      .L_details_22

    # Compare details with 23
    cmpl    $23, %edi
    je      .L_details_23

    # Compare details with 24
    cmpl    $24, %edi
    je      .L_details_24

    # Compare details with 25
    cmpl    $25, %edi
    je      .L_details_25

    # Compare details with 26
    cmpl    $26, %edi
    je      .L_details_26

    # Compare details with 27
    cmpl    $27, %edi
    je      .L_details_27

    # Compare details with 28
    cmpl    $28, %edi
    je      .L_details_28

    # Compare details with 29
    cmpl    $29, %edi
    je      .L_details_29

    # Compare details with 30
    cmpl    $30, %edi
    je      .L_details_30

    # Compare details with 31
    cmpl    $31, %edi
    je      .L_details_31

    # Compare details with 32
    cmpl    $32, %edi
    je      .L_details_32

    # Compare details with 33
    cmpl    $33, %edi
    je      .L_details_33

    # Compare details with 34
    cmpl    $34, %edi
    je      .L_details_34

    # Compare details with 35
    cmpl    $35, %edi
    je      .L_details_35

    # Compare details with 36
    cmpl    $36, %edi
    je      .L_details_36

    # Compare details with 37
    cmpl    $37, %edi
    je      .L_details_37

    # Compare details with 38
    cmpl    $38, %edi
    je      .L_details_38

    # Compare details with 39
    cmpl    $39, %edi
    je      .L_details_39

    # Compare details with 40
    cmpl    $40, %edi
    je      .L_details_40

    # Compare details with 41
    cmpl    $41, %edi
    je      .L_details_41

    # Compare details with 42
    cmpl    $42, %edi
    je      .L_details_42

    # Compare details with 43
    cmpl    $43, %edi
    je      .L_details_43

    # Compare details with 44
    cmpl    $44, %edi
    je      .L_details_44

    # Compare details with 45
    cmpl    $45, %edi
    je      .L_details_45

    # Compare details with 46
    cmpl    $46, %edi
    je      .L_details_46

    # Compare details with 47
    cmpl    $47, %edi
    je      .L_details_47

    # Compare details with 48
    cmpl    $48, %edi
    je      .L_details_48

    # Compare details with 49
    cmpl    $49, %edi
    je      .L_details_49

    # Compare details with 50
    cmpl    $50, %edi
    je      .L_details_50

    # Compare details with 51
    cmpl    $51, %edi
    je      .L_details_51

    # Compare details with 52
    cmpl    $52, %edi
    je      .L_details_52

    # Compare details with 53
    cmpl    $53, %edi
    je      .L_details_53

    # Compare details with 54
    cmpl    $54, %edi
    je      .L_details_54

    # Compare details with 55
    cmpl    $55, %edi
    je      .L_details_55

    # Compare details with 56
    cmpl    $56, %edi
    je      .L_details_56

    # Compare details with 57
    cmpl    $57, %edi
    je      .L_details_57

    # Compare details with 58
    cmpl    $58, %edi
    je      .L_details_58

    # Compare details with 59
    cmpl    $59, %edi
    je      .L_details_59

    # Compare details with 60
    cmpl    $60, %edi
    je      .L_details_60

    # Compare details with 61
    cmpl    $61, %edi
    je      .L_details_61

    # Compare details with 62
    cmpl    $62, %edi
    je      .L_details_62

    # Default case
    jmp     .L_details_default

.L_details_0:
    movsd   .LC_1_000000(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_1:
    movsd   .LC_0_995004(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)  # Fixed: Added destination operand
    jmp     .L_end

.L_details_2:
    movsd   .LC_0_980067(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_3:
    movsd   .LC_0_955336(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_4:
    movsd   .LC_0_921061(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_5:
    movsd   .LC_0_877583(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_6:
    movsd   .LC_0_825336(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_7:
    movsd   .LC_0_764842(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_8:
    movsd   .LC_0_696707(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_9:
    movsd   .LC_0_621610(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_10:
    movsd   .LC_0_540302(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_11:
    movsd   .LC_0_453596(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_12:
    movsd   .LC_0_362358(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_13:
    movsd   .LC_0_267499(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_14:
    movsd   .LC_0_169967(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_15:
    movsd   .LC_0_070737(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_16:
    movsd   .LC_neg_0_029200(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_17:
    movsd   .LC_neg_0_128844(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_18:
    movsd   .LC_neg_0_227202(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_19:
    movsd   .LC_neg_0_323290(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_20:
    movsd   .LC_neg_0_416147(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_21:
    movsd   .LC_neg_0_504846(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_22:
    movsd   .LC_neg_0_588501(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_23:
    movsd   .LC_neg_0_666276(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_24:
    movsd   .LC_neg_0_737394(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_25:
    movsd   .LC_neg_0_801144(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_26:
    movsd   .LC_neg_0_856889(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_27:
    movsd   .LC_neg_0_904072(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_28:
    movsd   .LC_neg_0_942222(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_29:
    movsd   .LC_neg_0_970958(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_30:
    movsd   .LC_neg_0_989992(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_31:
    movsd   .LC_neg_0_999135(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_32:
    movsd   .LC_neg_0_998295(%rip), %xmm0
    movsd   %xmm0, -8(%rbp)
    jmp     .L_end

.L_details_33:
    movsd   .