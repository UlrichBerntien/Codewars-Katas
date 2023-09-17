section .text
global mod

; uint64_t mod(uint64_t a, uint64_t n)
; input:
;    rdi - value a
;    rsi - value n
; return:
;    ryx - a mod n
mod:
    mov rax,rdi
    xor rdx,rdx    ; rdx:rax = value a, unsigned expanded
    div rsi        ; rax = quotient, rdx = remainded
    mov rax,rdx    ; return remainder
    ret