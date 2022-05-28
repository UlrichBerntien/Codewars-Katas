global uint32_to_ip

section .text

; <--- char *uint32_to_ip(char *ip, uint32_t num) --->
; Converter without using a library function.
uint32_to_ip:
  %push mycontext                 ; store current context
  %stacksize flat64               ; address stack frame with rbp
  %assign %$localsize 0
  BUFFER_SIZE equ 4*4             ; maximal 4 x 4 chars for IP address text
  %local b1:QWORD,b2:QWORD        ; reserve bytes
  %local buffer:BYTE
  %local result:QWORD
  
    enter %$localsize, 0          ; allocate stack frame
    mov [result], rdi             ; store pointer to return buffer
    lea rdi, [buffer+BUFFER_SIZE] ; rdi = running pointer in buffer
    std                           ; create address from end                 
    ; convert int into IP address text
    mov bx, 10                    ; base of the decimal numbers
    xor al, al
    stosb                         ; end of string
    mov rcx, 4                    ; 4 numbers in the IP address text
    jmp .start_ip_loop            ; start converting the least significant byte
.convert_ip_loop:
    mov al, '.'                   ; separate numbers by a dot
    stosb
.start_ip_loop:
    mov ax, si                    ; move the last byte into al
    and ax, 0xff
    shr rsi, 8
    ; convert byte in ax into decimal number
.convert_byte_loop:
    xor dx, dx
    div bx
    add dl,'0'                    ; convert value to ASCII decimal digit
    mov [rdi], dl                 ; write digit into buffer
    dec rdi                       ; down in the buffer
    test ax, ax
    jnz .convert_byte_loop
    loop .convert_ip_loop
    ; copy IP address into output buffer
    mov rsi, rdi
    inc rsi                       ; rsi = first char in the buffer
    mov rdi, [result]             ; rdi = result buffer
    cld                           ; prepare string copy rsi -> rdi
.copy_loop:
    lodsb
    stosb
    test al, al                   ; check for end of string
    jnz .copy_loop
    ; return
    mov rax, [result]             ; RAX <- IP address text
    leave                         ; freee stach frame
    ret
  
  %pop                      ; restore old context
; -----> endof uint32_to_ip <-----
