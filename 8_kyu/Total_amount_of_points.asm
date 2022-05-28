global points

section .text

; <--- unsigned points(const char *games[]) --->
points:
    xor r8d, r8d        ; edx = sum of points so far
    mov dx,'0:'         ; cached constants: dl = '0', dh = ':'
    mov rcx, 10         ; 10 strings in games[]
.loop:    
    mov rsi, [rdi]      ; rsi = string item
    add rdi, 8          ; to next item
    lodsw
    sub al, dl          ; char[0] must be a digit
    jb .invalid         ; invalid format
    mov bl, al          ; bl = first part of result (x)
    cmp ah, dh          ; char[1] must be a colon
    jne .invalid        ; invalid format
    lodsw               ; al = second part of result (y)
    sub al, dl          ; char[2] must be a digit
    jb .invalid         ; invalid format
    test ah, ah         ; char[3] must be 0 = end of string
    jnz .invalid        ; invalid format
    cmp bl,al
    jb .zero            ; case x < y   : 0 points
    je .one             ; case x == y  : add 1 point
    add r8d, 2          ; other, x > y : add 2 + 1 = 3 points
.one:
    inc r8d
.zero:
.invalid:               ; ignore invalid result format
    loop .loop
    mov eax, r8d        ; return sum of points
    ret
; ---------> endof pts <---------
