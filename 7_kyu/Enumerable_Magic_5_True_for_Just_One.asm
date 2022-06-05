SECTION .text
global one

one:

  %push mycontext             ; save the current context 
  %stacksize flat64           ; tell NASM to use rbp 
  %assign %$localsize 0       ; init localsize
  %local rest:qword           ; #rest elements in the array
  %local counter:byte         ; count of true returns
  %local arr:qword            ; base of the array
  %local fun:qword            ; pointer to the function

    enter   %$localsize,0     ; reserve local storage on stack

    ; init local variabales
    mov [rest], rsi
    mov [fun], rdx
    xor rcx, rcx
    mov [counter], cl
    jmp .check
    ; loop over the array
.loop:    
    mov [arr], rdi            ; save current pointer in the array
    mov edi, [rdi]            ; read int from the array
    call [fun]                ; call fun with array element as 1st parameter
    cmp al, 1                 ; only byte 1 is accepted as true. All other values: false.
    jne .false                ; function returns false
    inc byte [counter]        ; function returns true -> count the true
    cmp byte [counter], 1
    je .false
    xor rax, rax
    jmp .exit                 ; quick exit 2 times true -> return false
.false:
    mov rdi, [arr]
    add rdi, 4                ; rdi to next element in the array
.check:
    dec qword [rest]          ; reduce rest elements count
    jns  .loop
    xor rax, rax
    mov al, [counter]         ; counter = 1: return true / counter = 0: return false
.exit:
    leave                     ; free local storage
    ret
  
  %pop                        ; restore original context
