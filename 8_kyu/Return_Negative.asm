SECTION .text
global make_negative

make_negative:
    mov  eax,edi
    test eax,eax
    js   .is_neg
    neg  eax
.is_neg:
    ret