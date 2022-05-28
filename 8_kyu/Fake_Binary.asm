global fakebin

section .text

; <----- char *fakebin(const char *digits, char *buffer) ----->
fakebin:    
    xchg rsi, rdi   ; rsi = *digits, rdi = *buffer
    mov rbx, rdi    ; store pointer to buffer
    mov cx, '0'     ; cache constants
    mov dx, '1'
    mov r8b, '5'
    cld             ; process string upwards
    jmp .load
.loop:
    cmp al, r8b     ; cmp to '5'
    cmovb ax, cx    ; <'5' : convert to '0'
    cmovae ax ,dx   ; >='5': convert to '1'
    stosb
.load:
    lodsb
    test al,al
    jnz .loop     ; not end of string, process the char
    stosb         ; store 0, end of string
    mov rax, rbx  ; return pointer to result buffer
    ret
; ---------> end of fakebin <---------
