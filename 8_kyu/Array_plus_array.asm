global arrplusarr

; <-- RAX arrplusarr([dword RDI] a, [dword RSI] b, RDX na, RCX nb) -->
arrplusarr:
    xor r8, r8              ; r8 = sum of elements so far
    xor r9b, r9b            ; 0 = adding b, 1 = adding a
    ; add all items of array rsi, rcx
.adding:
    test ecx, ecx
    jz .end_adding        ; empty array
    test rsi, rsi
    jz .end_adding        ; null pointer
    lodsd                 ; load next int from array
    movsx rax, eax        ; expand int to long
    add r8, rax           ; sum in a long
    loop .adding
.end_adding:    
    test r9b, r9b
    jnz .done             ; the last array was a
    inc r9b               ; 1 = adding a
    mov rsi, rdi          ; pointer to a
    mov rcx, rdx          ; count of a
    jmp .adding
.done:    
    mov rax, r8           ; return sum of all items
    ret
; -----> endof arrplusarr <-----
