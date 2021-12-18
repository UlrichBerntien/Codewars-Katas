SECTION .text
global to_alternating_case
extern strdup

; Returns a new string in which every uppercase character in the original string is lowercase, and vice versa.
; Please return a pointer to a string allocated on the heap.
; arg0         = (const char *) The original string.
; return value = (char *)       The new string.
to_alternating_case:
    push  bp          ; 16 byte stack alignment
    call  strdup      ; don't change the given string, create a copy
    mov   rsi, rax    ; step through the string with rsi
    mov   rdi, rax    ; save the address in rdi
    mov   dl,0x20     ; bit between upper and lower case letters
    mov   cx,'az'     ; range of letters
    cld               ; step upwards to the string
    jmp   .next
.loop:
    mov   ah,al       
    or    ah,dl        ; to lower case
    cmp   ah,cl        
    jb    .next        ; below letter range
    cmp   ah,ch
    ja    .next        ; aboe letter range
    xor   al,dl        ; switch case
    mov   [rsi-1],al   ; change the string
.next:
    lodsb              ; read next char
    test   al,al       ; 0 terminates the string
    jnz   .loop
    mov   rax,rdi      ; return the address of the new string
    pop   bp
    ret
