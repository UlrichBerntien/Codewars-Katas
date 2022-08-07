global is_consecutive
section .text

; <-- AL is_consecutive(ro [byte RDI] s) -->
; Checks if all characters are grouped in the string.
; Supports only 8-bit character set.
is_consecutive:
    enter 0,0           ; save RSP, create stack frame
    mov rsi, rdi        ; rsi := start address of string
    cld
                        ; prepare a 256 bit array on the stack
    xor rax, rax
    times 4 push rax
    lodsb               ; parse string
    jmp .next
.error:
    xor eax, eax        ; return False, error found
    jmp .exit
.check:
    bts [rsp], eax
    jc .error           ; character seen before
    mov dl, al
.same:
    lodsb
    cmp dl, al
    je .same            ; scan the group of same characters
.next:
    test al, al
    jnz .check          ; next char in the string
    inc al              ; al := True, no error found
.exit:    
    leave        ; remove bit array from stack, restore RSP
    ret
; -----> endof is_consecutive <-----