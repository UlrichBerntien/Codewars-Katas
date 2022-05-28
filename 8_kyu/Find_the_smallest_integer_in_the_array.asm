section .text

global find_smallest_int
; int find_smallest_int(int *array, int size)
find_smallest_int:
    xor rax, rax
    test rdi, rdi
    jz .exit        ; argument is null pointer
    test rsi, rsi
    jz .exit        ; argument is 0 size array
    mov rcx, rsi    ; ecx = repeat counter
    mov rsi, rdi    ; rsi = running pointer in array
    mov edx, [rsi]  ; edx = min value
    cld             ; go upwards though the array
.loop:
    lodsd           ; load int = dword
    cmp edx, eax
    cmovg edx, eax
    loop .loop
    mov eax, edx     ; return the min
.exit:
  ret
