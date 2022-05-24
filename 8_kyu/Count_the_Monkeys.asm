global monkcnt
extern malloc

section .text

; <--- size_t *monkcnt(size_t n) --->
monkcnt:
    push rdi        ; save number of items
    sal rdi, 3      ; rdi = size of array, 8 bytes per item
    call malloc
    pop rcx         ; rcx = number of items
    or rax,rax
    jz return       ; malloc failed, returned null
    mov rsi, rax    ; rsi = save pointer to array
    mov rdi, rax    
    sub rdi, 8      ; rdi = base address with 1 start index
    xor rax, rax    ; rax = value to store
store:
    inc rax
    mov qword [rdi+rax*8], rax
    loop store
    mov rax, rsi    ; return pointer to array
return:
    ret
; ---------> endof monkcnt <---------