section .text
global clamp

; uint64_t clamp(uint64_t a, uint64_t lo, uint64_t hi)
; input:
;    rdi - value a to clamp
;    rsi - lower limit
;    rdx - upper limit
; return
;    rax - the clamped value
clamp:            
    mov rax,rdi          ; value a could be correct
    cmp rax,rsi
    cmovb rax,rsi        ; change to lo if a is below lo
    cmp rax,rdx
    cmova rax,rdx        ; cahnge to up if a is above hi
    ret