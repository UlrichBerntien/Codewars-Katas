section .text
global calc

; int calc(const char *source);
calc:
    xor    rsi,rsi           ; sum in rsi the difference
    mov    cl,10             ; number base
    mov    ch,7              ; the digit to earch
    mov    rdx,6             ; add 6 to the difference for each 7
    jmp    .start
.loop:
    div    cl                ; split the number into lower digit and rest
    cmp    ah,ch             
    jne    .no7
    add    rsi,rdx           ; add 6 for the digit 7
.no7:
    movzx  ax,al
    test   al,al
    jnz    .loop             ; loop for all digits
.start:
    movzx  ax,[rdi]
    inc    di
    test   al,al             ; 0 terminates the string
    jnz    .loop             ; loop for all chars
    mov    rax,rsi
    ret
