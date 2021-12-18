global testit
section .text
testit:
    mov rax,rdi
    or  rax,rsi
    ret