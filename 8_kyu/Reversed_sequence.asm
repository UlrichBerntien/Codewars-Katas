global reverse_seq
extern malloc

section .text
reverse_seq:
    mov qword [rsi], rdi ; return number of items in the array
    push rdi             ; save number of items
    sal rdi, 2           ; rdi = size of array in bytes, 4 bytes per item
    call malloc
    pop rcx              ; rcx = number of items
    or rcx, rcx
    jz return            ; no items, return
    or rax, rax
    jz return            ; malloc failed, returned null
    xor rdi, rdi         ; rdi = index in the array
store:
    mov dword [rax+rdi*4], ecx
    inc rdi
    loop store
return:
    ret
