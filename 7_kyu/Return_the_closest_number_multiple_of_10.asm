; unsigned round_to_10 (unsigned n)
; return the closest number to it that is divisible by 10
; Argument edi :=  n
; Return   eax

global round_to_10

section .text

round_to_10:
    mov eax, edi
    xor edx, edx    ; edx:eax := n
    add eax, 5
    adc edx, 0      ; edx:eax := n+5
    mov ecx, 10
    idiv ecx        ; eax := (n+5) div 10
    imul ecx        ; eax := round(n,10)
    ret
