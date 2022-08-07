global final_grade

section .text

; <--- unsigned final_grade(unsigned exam, unsigned nproj) --->
final_grade:
    xor rax, rax
    mov al, 100       ; result 100
    cmp rdi, 90
    jg .exit          ; ... if grade > 90
    cmp rsi, 10
    jg .exit          ; ... or projects > 10
    mov al, 90        ; result 90
    cmp rdi, 75
    jle .no75         ; ... if grade > 75
    cmp rsi, 5
    jge .exit         ; ... and projects >= 5
.no75:
    mov al, 75        ; result 75
    cmp rdi, 50
    jle .no50         ; ... if grade > 50
    cmp rsi, 2
    jge .exit         ; ... and  projects >= 2
.no50:
     xor al, al       ; else result is 0
.exit:    
    ret
; ---------> endof final_grade <---------
