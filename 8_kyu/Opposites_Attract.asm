section .text
global lovefunc

section .text
lovefunc:              ; int lovefunc(int flower1, int flower2)
                       ; input:  edi = flower1, esi = flower2
                       ; output: al (1 for true, 0 for false)
    mov al, dil
    add al, sil
    and al, 1
    ret
; end of lovefunc
