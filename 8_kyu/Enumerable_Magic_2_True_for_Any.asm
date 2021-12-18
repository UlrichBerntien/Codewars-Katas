SECTION .text
global any

; input
;    rdi - pointer to array of int
;    rsi - number of elements in the array
;    rdx - pointer to function of int return bool
; output
;    rax - true if any function calls return true
any:
    xor   rax, rax        ; return false on an parameter error
    test  rdi,rdi
    jz    .errorexit      ; null pointer to array: return false
    test  rsi,rsi
    jz    .errorexit      ; 0 array length: return false
    test  rdx,rdx
    jz    .errorexit      ; null pointer to function: return false
    push  r12
    push  r13
    push  r14
    mov   r12,rsi         ; counter
    mov   r13,rdi         ; pointer to current int in the array
    mov   r14,rdx         ; function address
.loop:
    mov   edi,[r13]
    call  r14            ; call function with current int
    test  al,al          ; bool is returned in al, ignore the other bits
    jnz   .return        ; funtion returns true: return true
    add   r13,4          ; no next array int
    dec   r12
    jnz   .loop          ; next array item or return false
.return:
    movzx rax,al         ; return rax
    pop   r14
    pop   r13
    pop   r12
.errorexit:
    ret
