.text
.globl _start

_start:
    movq $43690, %rax
    movq $21845, %rbx
    xorq %rax, %rbx
