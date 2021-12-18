SECTION .TEXT
global isNegativeZero

isNegativeZero:
    movq  rax,xmm0          ; load the float inti rax
    cmp   rax,[neg_zero]    ; simple binary compare
    setz  al                ; return true/false in al
    ret
    
SECTION .DATA
neg_zero dq 0x80000000      ; = -0.0 (MSB is sign bit)