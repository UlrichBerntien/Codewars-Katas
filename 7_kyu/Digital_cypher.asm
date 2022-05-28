global encode
extern malloc, strlen

section .text

; <--- unsigned char *encode(const char *s, unsigned k) --->
encode:
  %push mycontext
  %stacksize flat64       ; address local with ebp
  %assign %$localsize 0
  %local arg_s:qword      ; storage of *s
  %local result:qword     ; address of the result array buffer
  %local kcode:yword      ; the digits of k - 'a' + 1
  %local lastcode:qword   ; address of the top digit in kcode
  
    enter %$localsize, 0
    mov [arg_s], rdi      ; store *s
    
    ; convert number k into k_digits
    mov ecx, 10           ; decimal digits
    mov eax, esi          ; eax = k
    lea rdi, [kcode]      ; rdi = running pointer in array k_digits
next_digit:
    xor edx, edx
    div ecx               ; eax = eax / ecx, edx = eax % edx
    sub dl, 'a'-1         ; dl = offset to encode
    mov [rdi], dl         ; store value of digit
    inc rdi
    test eax, eax
    jnz next_digit        ; next digit of k
    dec rdi
    mov [lastcode], rdi   ; address of the topmost digit of k

  	; allocate result array
    mov rdi, [arg_s]
    call strlen           ; rax = strlen(*s)
    mov rdi, rax
    call malloc           ; allocate result array
    mov [result], rax
    test rax, rax
    jz exit               ; error exit: no memory
    
    ; encode the string
    mov rdi, rax          ; rdi = running pointer in result
    mov rsi, [arg_s]      ; rsi = running pointer in s
    mov rbx, [lastcode]   ; rbx = running pointer in kcode
    lea rcx, [kcode]      ; rcx = addr of the lowest kcode
next_char:
    lodsb                 ; al = next input char
    test al,al
    jz exit               ; end of string -> exit
    ;sub al, 'a'-1        ; this sub is already in the kcode
    add al, [rbx]
    dec rbx               ; next code of k
    cmp rbx, rcx          ; end of kcode array?
    jae no_wrap
    mov rbx, [lastcode]   ; use code k again
no_wrap:    
    stosb                 ; store the encoded char
    jmp next_char

exit:
    mov rax, [result]
    leave
    ret

  %pop
; ---------> endof encode <---------
