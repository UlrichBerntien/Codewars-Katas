global added_char
extern puts
section .text
; input: rdi = s1, rsi = s2
; output: al
; callee saved registers: rbx, rsp, rbp, r12-r15
added_char:
    sub rsp, 400h       ; allocate 100h dword table on stack
    ; init character counter table
    xor rax, rax
    mov ecx, 100h/2     ; init the 100h dwords with 100h/2 qwords
.init_loop:
    mov [rsp+rcx*8-8], rax
    loop .init_loop
    ; count characters in string s1
    xchg rsi, rdi       ; rsi = s1, rdi = s2
    cld                 ; go upwards in the strings
.s1_count_loop:
    lodsb
    inc dword [rsp+rax*4]
    test al, al
    jnz .s1_count_loop  ; repeat until end of string
    ; subtract count of characters in string s2
    ; a negative count indicates an added char in s2
    mov rsi, rdi        ; rsi = s2
.s2_count_loop:
    lodsb
    dec dword [rsp+rax*4]
    js .found           ; counter negative: found an added char
    test al, al
    jnz .s2_count_loop  ; repeat until end of string
    ; the rip is here: error, not found an added char
.found:
    add rsp, 400h
    ret
