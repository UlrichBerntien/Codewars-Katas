SECTION .text
global positive_sum

positive_sum:
    xor  eax,eax          ; sum up in eax
    test rsi, rsi
    jz   .end             ; count == 0: return
.next:
    mov   ecx, [rdi]      ; load int from values
    add   rdi, 4          ; ponter to next item in values
    test  ecx, ecx
    js    .count          ; skip add if int is negative
    add   eax, ecx        ; sum up the values
.count:
    dec   rsi
    jnz   .next           ; next item
.end    
    ret