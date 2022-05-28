global move

; <-- AX move(DI pos, SI roll) -->
move:
    lea rax, [rdi+rsi*2]
    ret
; -----> endof move <-----
