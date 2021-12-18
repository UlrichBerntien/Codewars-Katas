global _if

; <-- _if(DIL value, RSI func1, RDX func2) -->
_if:
    test  dil,dil
    jz    .false
    jmp   rsi
.false:
    jmp   rdx
; -----> endof _if <-----