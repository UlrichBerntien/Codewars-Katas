section .text
global moveTen

; void moveTen(char *str)
; WARNING: str must contain only lower case letters!
;          no upper case, no digits, etc
moveTen:
    mov   cl,10          ; offset to add
    mov   ch,'z'         ; last valid letter
    mov   dl,'z'-'a'+1   ; correction after overflow
    cld                  ; go upwards through the string
    jmp   .start
.loop
    add   al,cl          ; add offset
    cmp   al,ch          ; check overflow
    jbe   .inrange
    sub   al,dl          ; correct overflow
.inrange:
    stosb                ; replace in place
.start:
    mov   al,[rdi]
    test  al,al          ; 0 terminates the string
    jnz   .loop
    ret
