section .text
global convert_bits

; unsigned int convert_bits(unsigned int edi, unsigned int esi)
convert_bits:
    xor   rax, rax    ; count in rax the bits
    xor   rdi, rsi    ; rdi = the different bits
.next:                ; loop over all non-zero bit
    shr   rdi, 1      ; shift LSB into carry flag
    jnc   .no
    inc   rax         ; add non zero bit
.no:    
    test  rdi, rdi
    jnz   .next       ; loop over all 1 bits
    ret