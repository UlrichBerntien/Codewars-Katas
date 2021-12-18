SECTION .text
global is_uppercase

is_uppercase:
    cld
    mov  rsi,rdi
    mov  cx,'az'    ; range of lower case letters
    jmp  .next
.loop:
    cmp  al,cl
    jb   .next
    cmp  al,ch
    ja   .next
    xor   rax,rax    ; found a lower case letter -> false
    ret
.next:
    lodsb            ; next char from the string
    test  al,al      ; 0 terminates the string
    jnz   .loop
    mov   rax,1      ; end of string reached -> true
    ret
