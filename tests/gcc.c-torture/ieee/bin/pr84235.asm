    .globl _start
_start:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$16, %rsp
    movabsq	$4607182418800017408, %rax
    movl	$0, %edx
    vmovq	%rax, %xmm2
    vmovq	%rdx, %xmm3
    vdivsd	%xmm3, %xmm2, %xmm1
    vmovq	%xmm1, %rax
    movq	%rax, -8(%rbp)
    movq	-8(%rbp), %rax
    vmovq	%rax, %xmm4
    vucomisd	-8(%rbp), %xmm4
    jp	L2
    movq	-8(%rbp), %rax
    vmovq	%rax, %xmm5
    vucomisd	-8(%rbp), %xmm5
    jne	L2
    movq	-8(%rbp), %rax
    vmovq	%rax, %xmm7
    vsubsd	-8(%rbp), %xmm7, %xmm6
    vmovq	%xmm6, %rax
    movq	-8(%rbp), %rdx
    vmovq	%rdx, %xmm1
    vsubsd	-8(%rbp), %xmm1, %xmm0
    vmovq	%rax, %xmm2
    vucomisd	%xmm0, %xmm2
    jp	L9
    vmovq	%rax, %xmm3
    vucomisd	%xmm0, %xmm3
    je	L2
L9:
    movl	$1, %eax
    jmp	L5
L2:
    movl	$0, %eax
L5:
    movb	%al, -9(%rbp)
    andb	$1, -9(%rbp)
    movzbl	-9(%rbp), %eax
    xorl	$1, %eax
    testb	%al, %al
    je	L6
    call	abort
L6:
    movl	$0, %eax
    leave
    ret
