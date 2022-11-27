global even_or_odd

section .data

even  db "Even", 0
odd   db "Odd",0 

section .text

; Returns "Even" (string constant) if number is even, else "Odd".
; input: edi = number
; output: rax = address of string constant
even_or_odd:
    mov rax, odd
    mov rcx, even
    and di, 1
    cmovz rax, rcx
    ret
