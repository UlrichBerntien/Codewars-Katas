global reverse_num

section .text

; <--- long long reverse_num(long long n) --->
reverse_num:
    mov  rcx,10           ; base of th numbers
    xor  rsi,rsi          ; sum up the reversed in rsi
    mov  rax,rdi
    test rax,rax          ; split down the input in rax
    jns  .next
    neg  rax              ; calculate with positive numbers
.next:    
    imul rsi,rcx          ; shift left 1 digit in the result
    xor  rdx,rdx
    div  rcx              ; shift right 1 digit in the input
    add  rsi,rdx
    test rax,rax
    jnz  .next            ; repeat until 0 remains
    mov  rax,rsi
    test rdi,rdi
    jns  .plus
    neg  rax              ; correct the sign of the result
.plus:    
    ret
; ---------> endof reverse_num <---------