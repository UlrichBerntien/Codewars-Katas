section .text
global min, max

; int min(int* array [rdi], int arrayLength [esi]); --> [eax]
min:
    xor eax, eax
    cmp esi, 0
    jle .end              ; array empty -> return 0 
    cmp rdi, 0            ; null array -> return 0
    je .end
    mov ecx, esi
    mov rsi, rdi
    lea rdi, [rsi+4*rcx]  ; address of last item
    cld                   ; load array items asscending from rsi
    lodsd
    mov edx, eax          ; store current min in edx
    jmp .loop
.next:    
    lodsd                 ; load next item
    cmp edx, eax
    cmovg edx, eax        ; update current min
.loop:    
    cmp rsi, rdi
    jne .next             ; repeat until all items processed
    mov eax, edx          ; return min in eax
.end:    
    ret

; int max(int* array [rdi], int arrayLength [esi]); --> [eax]
max:
    xor eax, eax
    cmp esi, 0
    jle .end              ; array empty -> return 0 
    cmp rdi, 0            ; null array -> return 0
    je .end
    mov ecx, esi
    mov rsi, rdi
    lea rdi, [rsi+4*rcx]  ; address of last item
    cld                   ; load array items asscending from rsi
    lodsd
    mov edx, eax          ; store current min in edx
    jmp .loop
.next:    
    lodsd                 ; load next item
    cmp edx, eax
    cmovl edx, eax        ; update current min
.loop:    
    cmp rsi, rdi
    jne .next             ; repeat until all items processed
    mov eax, edx          ; return max in eax
.end:    
    ret
