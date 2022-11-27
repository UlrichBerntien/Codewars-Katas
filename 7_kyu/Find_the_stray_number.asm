section .text
global stray

; C-Prototype:
;     int stray(const int numbers[], const int size)
; Returns the non-common number.
; All other numbers must have the same value.
stray: 
        cld                 ; parse array upwards
        xor rax, rax        ; return 0 in error case
        mov ecx, esi        ; ecx = number of items in array  
        cmp ecx, 3
        jl .end             ; less than 3 items in array -> error exit
        mov rsi, rdi        ; rsi = address of number array
        test rsi, rsi
        jz .end             ; null pointer found -> error exit
        mov edx, [rsi]      ; edx = candidate for common number
        cmp edx, [rsi+4]
        je .loop            ; edx is common number
        cmp edx, [rsi+8]
        je .loop            ; edx is common number
        mov edx, [rsi+8]    ; load common number
.loop:  lodsd               ; load next number from array
        cmp eax, edx        ; found the other number
        jne .end
        loop .loop          ; while not end of array
.end:                       ; (if all numbers are equal return this)
        ret
