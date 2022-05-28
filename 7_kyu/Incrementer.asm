global incrementer

; <-- [dword RAX] incrementer([dword RDI] dest, ro [dword RSI] src, RDX n) -->
incrementer:
    xor rax, rax
    mov rcx, rdx        ; rcx = item counter
    test rcx, rcx       ; empty input?
    jz exit             ; exit with null return
    push rdi            ; store *dest for return
    xor edx, edx        ; edx = offset to add
next:
    lodsd               ; eax = next item
    inc edx             ; edx = next offset to add
    cmp edx, 10
    jb  no_add_limit
    xor edx, edx        ; limit offset to 9
no_add_limit:    
    add eax, edx
    cmp eax, 10
    jb  no_overflow_10
    sub eax, 10         ; add overflow, eg. 12 -> 2
no_overflow_10:
    stosd
    loop next
    pop rax             ; rax = *dest
exit:
    ret
; -----> endof incrementer <-----
