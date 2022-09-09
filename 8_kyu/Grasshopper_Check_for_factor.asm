section .text

global check_for_factor

; bool check_for_factor([positive] int base, [positive] int factor)
; Return true if factor is a factor of base.
check_for_factor:
    mov eax, edi
    xor edx, edx      ; edx;eax = base
    idiv esi          ; edx = remainder of base / factor 
    xor eax, eax
    test edx, edx     
    setz al           ; return true if remainder is 0
    ret
