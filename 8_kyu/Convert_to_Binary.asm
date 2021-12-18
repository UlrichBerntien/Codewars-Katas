global to_binary

section .text

; <--- unsigned long long to_binary(unsigned short num) --->
to_binary:
    mov   rax, 1
    xor   rdx, rdx      ; rdx:rax "10-value" of current bit
    mov   r8, 10
    xor   r9, r9        ; sum up the result in r9
.loop:    
    shr   rdi, 1        ; check current bit
    jnc   .digit0
    add   r9, rax       ; bit is set => add current 10-value
.digit0:
    mul   r8            ; 10 value of next bit
    test  rdi, rdi
    jnz   .loop         ; repeat until all bits handled
    mov   rax, r9
    ret
; -----> end of tobin <-----