SECTION .text
global xo

; C-Prototype:
;       extern bool xo (const char* str);
; Checks number of 'x' and 'o' characters in the string.
; Returns true if and only if the number is equal.
; Supports only ASCII 8-bit character set.
; Compare is case insensitive.
xo:
    mov rsi, rdi        ; use rsi to address the str
    xor ecx, ecx        ; counter of the chars: o:+1, x:-1
    test rsi, rsi
    jz .loopend         ; null pointer argument
    cld                 ; go upwards in the string
.loop:
    lodsb               ; load next char from the str
    test al, al
    jz .loopend         ; loop until end of string, char '\0'
    or al,0x20          ; convert to lowercase
    cmp al,'o'
    jne .no_o
    inc ecx             ; "count" the o
    jmp .loop
.no_o:
    cmp al,'x'
    jne .loop           ; the char is no o or x
    dec ecx             ; "count" the x
    jmp .loop
.loopend:    
    xor eax, eax
    test ecx, ecx
    jnz .end            ; ecx != 0: return 0 = false
    inc eax             ; ecx == 0: return 1 = true
.end:    
    ret
