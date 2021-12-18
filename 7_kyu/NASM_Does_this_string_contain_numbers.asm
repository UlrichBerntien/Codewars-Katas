global has_digits
section .text

; input:
;    rdi - Pointer to ASCII zero string, or NULL
; output:
;    rax - True if and only if the string contaings a decimal digit.
has_digits:
    test  rdi,rdi
    jz    .false          ; null pointer -> return false
    mov   dx,'09'         ; range of digits
.next:
    mov   al,[rdi]
    test  al,al           
    jz    .false          ; end of string reached
    inc   di
    cmp   al,dl
    jb    .next
    cmp   al,dh
    ja    .next            ; no decimal digit     
    mov   rax,1            ; it is a decimal digit
    ret
.false:
    xor   rax,rax
    ret
