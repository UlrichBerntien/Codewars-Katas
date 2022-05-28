section .text
global bulb_maze

; bool bulb_maze(const char *maze);
bulb_maze:
    mov rsi,rdi   ; rsi = pointer running in the string

    ; case minute 0, 2, 4, ...
.minute0:         
    lodsb
    test al, al   ; end of maze -> ok
    jz  .true
    cmp al, 'x'   ; no light in 0,2,.. -> ok
    je  .minute1
    cmp al, ' '
    jne .false    ; other -> caught

; case minute 1, 3, 5, ...
.minute1:         
    lodsb
    test al, al   ; end of maze -> ok
    jz  .true
    cmp al, 'o'   ; no light in 1,3,.. -> ok
    je  .minute0
    cmp al, ' '   ; never light -> ok
    je .minute0

.false:
    xor rax, rax
    ret
.true:
    mov rax, 1
    ret
