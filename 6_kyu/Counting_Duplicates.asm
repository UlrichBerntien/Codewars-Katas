global duplicate_count
section .text

; Count number of duplicate characters.
; Count letters a-z case-insensituíve.
; Return number of characater more than twice in the string.
; Argument RDI = ASCII zero string.
; Return EAX = Count of duplicates
duplicate_count:
    ; prepare a map ASCII code -> 16-bit counter on the stack
    enter 200H,0            ; reserve storage
    xor ebx, ebx            ; rbx := constant 0
    mov dx, 2               ; dx := 16-bit constant 2
    mov ecx, 0ffH/4         ; loop over all 16-bit counter
.zero:    
    mov [rsp+8*rcx], rbx    ; initalise all counters
    dec rcx
    jge .zero               ; to next group of 4 counters
    ; count characters in the string
    mov rsi, rdi            ; rsi goes upwards in the string
    cld
    xor eax, eax
.string:
    lodsb
    test al, al
    jz .endstring           ; 0 -> end of string
    inc word [rsp+2*rax]
    jnc .string
    mov [rsp+2*rax], dx     ; overflow of counter
    jmp .string
.endstring:
    ; handle case in-sensitive
    mov rcx, 'A'            ; loop over A..Z
    lea rdi, [rsp+2*('a'-'A')]  ; rdi to address lower case letters
.case:
    mov ax, [rsp+2*rcx]
    mov [rsp+2*rcx], bx     ; clear uppercase count
    add [rdi+2*rcx], ax     ; add uppcase count to lowcase count
    jnc .casenov
    mov [rdi+2*rcx], dx     ; overflow of counter
.casenov:
    inc ecx                 ; to next counter
    cmp ecx,'Z'
    jbe .case
    ; count number of duplicates
    xor eax,eax
    mov ecx,0ffH            ; loop over 0xff..0
.count:
    cmp [rsp+2*rcx], dx     ; compare counter <-> 2
    jl .countno
    inc eax                 ; count if 2 or more
.countno:    
    loop .count             ; to next counter
    leave
    ret
