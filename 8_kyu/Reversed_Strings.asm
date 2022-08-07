SECTION .text
global reverse
extern malloc

; char *reverse(const char *);
; Return a heap-allocated string representing the reversed value of the argument.
; Support 8-bit character set only.
reverse:
  enter 16,0          ; 16 bytes local memmory
  mov [rbp-8], rdi    ; save pointer to argument string
  test rdi, rdi
  jz .error           ; argument error: null string
  ; determine length of the string
  xor ecx, ecx
  dec rcx             ; rcx := -1
  xor al, al
  cld
  repne scasb         ; scan for \0 at string end
  neg rcx
  dec rcx             ; now rcx = string length including \0
  mov [rbp-16], rcx   ; save buffer length
  ; allocate buffer
  mov rdi, rcx
  call malloc
  test rax, rax
  jz .error           ; allocation error
  ; copy string
  mov rdi, rax        ; rdi := first char of dest string
  mov rcx, [rbp-16]
  dec rcx             ; rcx = number of chars to copy
  mov rsi, [rbp-8]    ; rsi = first char in source string
  xor al, al          ; the \0 at the string end
  jmp .write
.copy:
  mov al,[rsi]        ; copy one char/one byte
  inc rsi
.write:
  mov [rdi+rcx], al
  dec rcx
  jge .copy           ; copy next char
  jmp .exit           ; ok.  
.error:  
  xor edi, edi        ; return null pointer as error value
.exit:
  mov rax, rdi        ; return pointer to new string
  leave
  ret
