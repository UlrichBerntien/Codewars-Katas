global hex_to_dec

section .text

; <--- unsigned hex_to_dec(const char *hex) --->
; input: RDI pointed to ASCII zero string
; output: value in rax
; On an invalid char, the value up to the bug is returned.
hex_to_dec:
    xor rax, rax          ; sum the value in rax
.loop:    
    mov bl,[rdi]
    sub bl,'0'
    jl .exit               ; no hex digit, could be \0 or invalid
    cmp bl,9
    jbe .converted         ; it was a digit 0-9
    sub bl,'A'-'0'
    jl .exit               ; invalid char
    cmp bl,5
    jbe .isaf              ; valid A..F char
    sub bl,'a'-'A'
    jl .exit               ; invalid char
    cmp bl,5
    ja .exit               ; invalid char, no a..f
.isaf:
    add bl,10
.converted:
    shl rax,4
    movzx rbx,bl
    add rax,rbx            ; rax = rax*16 + value of current char
    inc rdi                ; to next char
    jmp .loop
.exit:    
    ret
; ---------> endof hex2dec <---------