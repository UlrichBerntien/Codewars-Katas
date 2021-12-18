global halving_sum
section .text

halving_sum:
    xor rax, rax    ; sum in rax
.next:
    add rax, rdi    ; add n(i)
    sar rdi, 1      ; n(i+1) = n(i) div 2 
    jnz .next       ; until n(i) == 0
  ret