global diffsum

; <-- EAX diffsum(ro [dword RDI] arr, RSI n) -->
diffsum:
    ; check parameters
    xor   eax, eax
    test  rdi, rdi
    jz    .exit           ; no array, return 0
    test  rsi, rsi     
    jz    .exit           ; no elements, return 0
    ; prepare loop    
    mov   rcx, rsi        ; rcx = counter
    mov   rsi, rdi        ; rsi = running pointer in input array
    lodsd
    mov   ebx, eax        ; ebx = max of array
    mov   edx, eax        ; edx = min of array
    jmp   .next
    ; find min and max of the items in the array
.loop:    
    lodsd
    cmp   ebx, eax
    cmovl ebx, eax
    cmp   edx, eax
    cmovg edx, eax
.next: 
    loop  .loop
    ; calculate the summ of differences
    mov   eax, ebx
    sub   eax, edx        ; result = max - min
.exit:    
    ret
; -----> endof diffsum <-----
