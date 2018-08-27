test_isunordered:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$16, %rsp
    movl	%edi, -4(%rbp)
    fldt	16(%rbp)
    fldt	32(%rbp)
    fucomip	%st(1), %st
    fstp	%st(0)
    jnp	L2
    cmpl	$0, -4(%rbp)
    jne	L3
    call	abort
L3:
    jmp	L1
L2:
    cmpl	$0, -4(%rbp)
    je	L1
    call	abort
L1:
    leave
    ret
test_isless:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$16, %rsp
    movl	%edi, -4(%rbp)
    fldt	32(%rbp)
    fldt	16(%rbp)
    fxch	%st(1)
    fucomip	%st(1), %st
    fstp	%st(0)
    setbe	%al
    xorl	$1, %eax
    testb	%al, %al
    je	L6
    cmpl	$0, -4(%rbp)
    jne	L7
    call	abort
L7:
    jmp	L5
L6:
    cmpl	$0, -4(%rbp)
    je	L5
    call	abort
L5:
    leave
    ret
test_islessequal:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$16, %rsp
    movl	%edi, -4(%rbp)
    fldt	32(%rbp)
    fldt	16(%rbp)
    fxch	%st(1)
    fucomip	%st(1), %st
    fstp	%st(0)
    setb	%al
    xorl	$1, %eax
    testb	%al, %al
    je	L10
    cmpl	$0, -4(%rbp)
    jne	L11
    call	abort
L11:
    jmp	L9
L10:
    cmpl	$0, -4(%rbp)
    je	L9
    call	abort
L9:
    leave
    ret
test_isgreater:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$16, %rsp
    movl	%edi, -4(%rbp)
    fldt	16(%rbp)
    fldt	32(%rbp)
    fxch	%st(1)
    fucomip	%st(1), %st
    fstp	%st(0)
    setbe	%al
    xorl	$1, %eax
    testb	%al, %al
    je	L14
    cmpl	$0, -4(%rbp)
    jne	L15
    call	abort
L15:
    jmp	L13
L14:
    cmpl	$0, -4(%rbp)
    je	L13
    call	abort
L13:
    leave
    ret
test_isgreaterequal:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$16, %rsp
    movl	%edi, -4(%rbp)
    fldt	16(%rbp)
    fldt	32(%rbp)
    fxch	%st(1)
    fucomip	%st(1), %st
    fstp	%st(0)
    setb	%al
    xorl	$1, %eax
    testb	%al, %al
    je	L18
    cmpl	$0, -4(%rbp)
    jne	L19
    call	abort
L19:
    jmp	L17
L18:
    cmpl	$0, -4(%rbp)
    je	L17
    call	abort
L17:
    leave
    ret
test_islessgreater:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$16, %rsp
    movl	%edi, -4(%rbp)
    fldt	16(%rbp)
    fldt	32(%rbp)
    fucomip	%st(1), %st
    fstp	%st(0)
    sete	%al
    xorl	$1, %eax
    testb	%al, %al
    je	L22
    cmpl	$0, -4(%rbp)
    jne	L23
    call	abort
L23:
    jmp	L21
L22:
    cmpl	$0, -4(%rbp)
    je	L21
    call	abort
L21:
    leave
    ret
    .globl _start
_start:
    pushq	%rbp
    movq	%rsp, %rbp
    pushq	%rbx
    subq	$24, %rsp
    movl	$6, -20(%rbp)
    movl	$0, -24(%rbp)
    jmp	L26
L27:
    movl	-24(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$4, %rax
    addq	$32, %rax
    addq	$data.2290, %rax
    movzbl	(%rax), %eax
    andl	$1, %eax
    movzbl	%al, %esi
    movl	-24(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$4, %rax
    addq	$data.2290, %rax
    movq	16(%rax), %rcx
    movl	24(%rax), %ebx
    movl	-24(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$4, %rax
    addq	$data.2290, %rax
    movl	8(%rax), %edx
    movq	(%rax), %rax
    pushq	%rbx
    pushq	%rcx
    pushq	%rdx
    pushq	%rax
    movl	%esi, %edi
    call	test_isunordered
    addq	$32, %rsp
    movl	-24(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$4, %rax
    addq	$32, %rax
    addq	$data.2290, %rax
    movzbl	(%rax), %eax
    shrb	%al
    andl	$1, %eax
    movzbl	%al, %esi
    movl	-24(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$4, %rax
    addq	$data.2290, %rax
    movq	16(%rax), %rcx
    movl	24(%rax), %ebx
    movl	-24(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$4, %rax
    addq	$data.2290, %rax
    movl	8(%rax), %edx
    movq	(%rax), %rax
    pushq	%rbx
    pushq	%rcx
    pushq	%rdx
    pushq	%rax
    movl	%esi, %edi
    call	test_isless
    addq	$32, %rsp
    movl	-24(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$4, %rax
    addq	$32, %rax
    addq	$data.2290, %rax
    movzbl	(%rax), %eax
    shrb	$2, %al
    andl	$1, %eax
    movzbl	%al, %esi
    movl	-24(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$4, %rax
    addq	$data.2290, %rax
    movq	16(%rax), %rcx
    movl	24(%rax), %ebx
    movl	-24(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$4, %rax
    addq	$data.2290, %rax
    movl	8(%rax), %edx
    movq	(%rax), %rax
    pushq	%rbx
    pushq	%rcx
    pushq	%rdx
    pushq	%rax
    movl	%esi, %edi
    call	test_islessequal
    addq	$32, %rsp
    movl	-24(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$4, %rax
    addq	$32, %rax
    addq	$data.2290, %rax
    movzbl	(%rax), %eax
    shrb	$3, %al
    andl	$1, %eax
    movzbl	%al, %esi
    movl	-24(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$4, %rax
    addq	$data.2290, %rax
    movq	16(%rax), %rcx
    movl	24(%rax), %ebx
    movl	-24(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$4, %rax
    addq	$data.2290, %rax
    movl	8(%rax), %edx
    movq	(%rax), %rax
    pushq	%rbx
    pushq	%rcx
    pushq	%rdx
    pushq	%rax
    movl	%esi, %edi
    call	test_isgreater
    addq	$32, %rsp
    movl	-24(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$4, %rax
    addq	$32, %rax
    addq	$data.2290, %rax
    movzbl	(%rax), %eax
    shrb	$4, %al
    andl	$1, %eax
    movzbl	%al, %esi
    movl	-24(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$4, %rax
    addq	$data.2290, %rax
    movq	16(%rax), %rcx
    movl	24(%rax), %ebx
    movl	-24(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$4, %rax
    addq	$data.2290, %rax
    movl	8(%rax), %edx
    movq	(%rax), %rax
    pushq	%rbx
    pushq	%rcx
    pushq	%rdx
    pushq	%rax
    movl	%esi, %edi
    call	test_isgreaterequal
    addq	$32, %rsp
    movl	-24(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$4, %rax
    addq	$32, %rax
    addq	$data.2290, %rax
    movzbl	(%rax), %eax
    shrb	$5, %al
    andl	$1, %eax
    movzbl	%al, %esi
    movl	-24(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$4, %rax
    addq	$data.2290, %rax
    movq	16(%rax), %rcx
    movl	24(%rax), %ebx
    movl	-24(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$4, %rax
    addq	$data.2290, %rax
    movl	8(%rax), %edx
    movq	(%rax), %rax
    pushq	%rbx
    pushq	%rcx
    pushq	%rdx
    pushq	%rax
    movl	%esi, %edi
    call	test_islessgreater
    addq	$32, %rsp
    addl	$1, -24(%rbp)
L26:
    movl	-24(%rbp), %eax
    cmpl	-20(%rbp), %eax
    jl	L27
    movl	$0, %edi
    call	exit
data.2290:
    .long	0
    .long	3221225472
    .long	32767
    .long	0
    .long	0
    .long	3221225472
    .long	32767
    .long	0
    .byte	1
    .zero	15
    .long	0
    .long	0
    .long	0
    .long	0
    .long	0
    .long	3221225472
    .long	32767
    .long	0
    .byte	1
    .zero	15
    .long	0
    .long	3221225472
    .long	32767
    .long	0
    .long	0
    .long	0
    .long	0
    .long	0
    .byte	1
    .zero	15
    .long	0
    .long	0
    .long	0
    .long	0
    .long	0
    .long	0
    .long	0
    .long	0
    .byte	20
    .zero	15
    .long	0
    .long	2147483648
    .long	16383
    .long	0
    .long	0
    .long	2147483648
    .long	16384
    .long	0
    .byte	38
    .zero	15
    .long	0
    .long	2147483648
    .long	16384
    .long	0
    .long	0
    .long	2147483648
    .long	16383
    .long	0
    .byte	56
    .zero	15
