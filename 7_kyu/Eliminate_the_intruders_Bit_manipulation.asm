section .text
global eliminate_unset_bits

; unsigned long eliminate_unset_bits(const char* number (RDI));
eliminate_unset_bits:
    xor rax, rax      ; collect the 1 bits in rax
    mov ch,'1'        ; the symbol of a 1 bit
    jmp .next
.one:
    stc               ; push a 1 bit into rax
    rcl rax,1
.next:
    mov cl, [rdi]     ; read char from strinh
    inc rdi           ; move pointer to next char
    cmp cl,ch
    je  .one          ; current char is '1', and not end
    test cl,cl
    jnz  .next        ; current char is not end
    ret