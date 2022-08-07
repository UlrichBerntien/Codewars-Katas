section .text
global feast

; Load first and last char of a ASCII zero string.
; argument: rsi = start of the string.
; return: al = first char, ah = last char (before \0)
; Function uses ONLY rsi, rax, rbx.
firstlast:
    mov bl, [rsi]     ; store first char
    mov al, bl
.loop:
    mov ah, al        ; char before current char
    lodsb
    test al, al       ; al == 0, end of string?
    jnz .loop             
    mov al, bl        ; al = first, ah = last char
    ret
   

; bool feast(const char* beast [rdi], const char* dish [rsi]);
; return: al
feast:
    cld               ; process strings upwards
    call firstlast
    mov ecx, eax      ; cx = first, last char of dish
    mov rsi, rdi
    call firstlast    ; ax = first, last char of beast
    cmp cx, ax
    sete al           ; return true if last&first char equal
    movzx eax, al
    ret
