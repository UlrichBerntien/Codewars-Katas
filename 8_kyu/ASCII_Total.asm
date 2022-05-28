section .text
global uni_total

; int uni_total(const char *s);
; *s --> rdi, result --> rax
uni_total:
    xor rcx, rcx      ; rcx = sum up here
    xor rax, rax
    mov rsi, rdi      ; rsi running pointer in s
    test rsi, rsi
    jz .exit          ; error exit: null pointer
    cld               ; run upwards though the string
.loop:   
    lodsb
    add rcx, rax      ; sum up all ASCII values
    test al, al
    jnz .loop         ; end of string
.exit:
    mov rax, rcx      ; return the sum
    ret
