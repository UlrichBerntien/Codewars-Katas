SECTION .text
global valid_parentheses

; Returns a boolean indicating if the order of parenthesis in the string is valid
; arg0         = (const char*)
; return value = (bool) A boolean indicating if the string contains valid parenthesis
valid_parentheses:
    mov rsi, rdi    ; rsi = pointer running in the string
    xor rcx, rcx    ; rcx = number of current opened parenthesis
    mov bx,'()'     ; constants: bl = '(' and bh = ')'
.loop
    lodsb
    test  al, al
    je    .exit       ; end of string reached
    cmp   al, bl      ; al == '('?
    jne   .no_open
    inc   cx          ; count open parenthesis
    jmp   .loop
.no_open:
    cmp   al, bh      ; al == ')' ?
    jne   .loop       ; other char in string
    dec   cx          ; one parenthesis is closed
    jge   .loop       ; ok if not negative
.false:               ; too often closed parenthesis
    xor   rax, rax
    ret
.exit:
    test  rcx,rcx     ; at end of string
    jnz   .false      ; but closing paranthesis missing
.true:
    mov   rax, 1
    ret
