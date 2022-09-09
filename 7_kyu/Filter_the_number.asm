section .text
global filter_string

; long long filter_string(const char *value)
; Parses the decimal digits in the string.
; Ignores all other characters.
filter_string:
    xor edx, edx
    xor eax, eax      ; rdx:rax accu for parsed number 
    test rdi, rdi
    jz .exit          ; NULL pointer argument: return 0
    mov rsi, 10       ; base of decimal numbers
    mov bx, 0x0900+'0'; constants bh = 9, bl = '0'
    xor ecx, ecx      ; clear rcx, load only cl part
.loop:    
    mov cl, [rdi]
    inc rdi
    test cl, cl
    jz .exit          ; end of string found
    sub cl, bl        ; char < '0' ?
    jl .loop          ; no digit, read next char
    cmp cl, bh        ; value > 9 ?
    ja .loop          ; no digit, read next char
    mul rsi
    add rax, rcx      ; add digit to the number
    jmp .loop        
  .exit:
    ret
