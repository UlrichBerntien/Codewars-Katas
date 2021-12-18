global oddcnt

; <-- EAX oddcnt(EDI n) -->
oddcnt:
    mov  rax,rdi
    sar  rax,1
    ret
; -----> endof oddcnt <-----