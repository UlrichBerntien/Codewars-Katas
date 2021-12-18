SECTION .text
global none

; input
;    rdi - pointer to array of int
;    rsi - number of elements in the array
;    rdx - pointer to function of int return bool
; output
;    rax - true if none function calls return true
none:
    push  r12
    push  r13
    push  r14
    mov   r12,rsi         ; counter
    test  r12,r12
    jz    .returntrue     ; 0 array length: return true
    mov   r13,rdi         ; pointer to current int in the array
    test  r13,r13
    jz    .returntrue     ; null pointer to array: return true
    mov   r14,rdx         ; function address
    test  r14,r14
    jz    .returntrue     ; null pointer to function: return true
.loop:
    mov   edi,[r13]
    call  r14            ; call function with current int
    test  al,al          ; bool is returned in al, ignore the other bits
    jnz   .returnfalse   ; funtion returns true: return false
    add   r13,4          ; no next array int
    dec   r12
    jnz   .loop          ; next array item or return false
.returntrue:    
    mov   rax,1          ; none function returns true: return true
    jmp   .return
.returnfalse:
    xor   rax,rax         ; return false
.return
    pop   r14
    pop   r13
    pop   r12
    ret
