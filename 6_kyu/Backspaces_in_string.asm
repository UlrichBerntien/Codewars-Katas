global strclr
extern strdup

; char *strclr(const char *s)
; Returns a new allocated string.
;
; Interprets a string with "backspaces".
; "#" is like a backspace. 
; E.g. the  input "a###bc#d" is interpreted as "bd".
strclr:
    call strdup       ; copy string, the argument is const string
    mov cl,'#'        ; special backspace char as constant
    mov edx, eax      ; hold base address of the string
    mov edi, eax      ; address of the next char to write
    mov esi, eax      ; address of the next char to read
    cld               ; parse string upwards
.next:    
    lodsb             ; load next char from string
    cmp al,cl         ; a backspace ?
    jne .nobackspace
    cmp edi, edx
    je .next          ; output is empty, nothing to delete
    dec edi           ; delete last char in output
    jmp .next
.nobackspace:
    stosb             ; write into the output
    test al,al        ; end of string ?
    jnz .next
    mov eax, edx      ; return the string
    ret
; -----> endof strclr <-----
