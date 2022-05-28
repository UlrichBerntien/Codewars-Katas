global bin_to_dec

section .text

; <--- unsigned bin_to_dec(const char *bin) --->
bin_to_dec:
    xor rcx, rcx    ; ecx = accumulated value
    mov bx, '10'    ; cache constants bl='1', bh = '0'
    mov rsi, rdi    ; rsi = running pointer in string
    test rsi, rsi
    jz .exit        ; error: null string pointer
.loop:
    lodsb
    cmp al, bl      ; cmp to '1'
    jne .not1
    shl ecx, 1      ; digit is '1'
    inc ecx
    jmp .loop
.not1:
    cmp al, bh      ; cmp to '0'
    jne .exit
    shl ecx, 1      ; digit is '0' 
    jmp .loop
.exit:              ; not '0' stop parsing
    mov rax, rcx    ; return value
    ret
; ---------> endof bin2dec <---------
