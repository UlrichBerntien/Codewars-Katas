global alphabet_war

section .text

; <----- char *alphabet_war(const char *fight) ----->
alphabet_war:
    xor     rcx,rcx             ; sum powers in rcx
    mov     rsi,table           ; base address of power table
    jmp     .start
.loop:
    movsx   rax,byte [rsi+rax]  ; translate chr to power
    add     rcx,rax
.start:    
    movzx   rax,byte [rdi]      ; load next char
    inc     rdi
    test    al,al               ; 0 terminates the string
    jnz     .loop
    cmp     rcx,0
    cmovz   rax,[adr_msg_equal] ; rax = result string
    cmovg   rax,[adr_msg_left]
    cmovl   rax,[adr_msg_right]
    ret
; ---------> end of alphawar <---------

section .data

; Messages
msg_equal:  db "Let's fight again!",0
msg_left:   db "Left side wins!",0
msg_right:  db "Right side wins!",0

; Addresses of the messages
adr_msg_equal dq msg_equal
adr_msg_left  dq msg_left
adr_msg_right dq msg_right

; Translation table ASCII to war power
; left side letters: positive values
; rught side letters: negative values
table:
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 2, 0,-2, 0, 0, 0, 0, 0, 0, 0, 0,-4, 0, 0
    db 3,-3, 0, 1, 0, 0, 0, 4, 0, 0,-1, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
