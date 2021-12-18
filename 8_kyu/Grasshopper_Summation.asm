section .text
global summation

; input:
;    rcx - value n
; output
;    rax - sum of number 1..n
; Using Gauss formula
summation:
    mov rax, rdi      ; rax = n
    mov rcx, rdi
    inc rcx           ; rcx = n+1
    mul rcx           ; rdx:rax = n*(n+1)
    sar rdx, 1
    rcr rax, 1        ; rdx:rax = n*(n+1)/2
    ret