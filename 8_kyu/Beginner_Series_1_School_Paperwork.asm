global paperwork

section .text

; int paperwork(int n, int m)
; return n*m if n>0 and m>0, else 0.
paperwork:
    xor eax, eax
    test esi, esi
    jle .exit
    test edi, edi
    jle .exit
    mov eax, edi
    cdq
    mul esi
.exit:    
    ret
