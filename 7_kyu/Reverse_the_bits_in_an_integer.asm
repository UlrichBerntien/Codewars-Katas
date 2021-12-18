global revbits

; <-- EAX revbits(EDI n) -->
revbits:
    xor   rax,rax
.next:
    sar   rdi,1
    rcl   rax,1
    test  rdi,rdi
    jnz   .next
    ret
; -----> endof revbits <-----