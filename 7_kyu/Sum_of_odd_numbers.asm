global row_odd_sum_numbers

section .text

; <----- unsigned long long row_odd_sum_numbers(unsigned n) ----->
row_odd_sum_numbers:
    mov rax, rdi
    cqo             ; rdx:rax = n
    imul rdi        ; rdx:rax = n*n
    imul rdi        ; rdx:rax = n*n*n
    ret
; ---------> end of roddsum <---------
