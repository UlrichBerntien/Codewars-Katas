global find_missing

section .text

; <--- int find_missing(const int *nums, size_t n) --->
find_missing:
    ; check arguments
    test rdi, rdi
    je .error_exit          ; error: null pointer argument
    cmp rsi, 2
    jb .error_exit          ; error: less than 2 elements
    cmp rsi, 0x7FFFFFFF
    ja .error_exit          ; error: more than max int elements
    ; calculate the delta
    mov rbx, rdi
    mov eax,[rbx+rsi*4-4]
    sub eax,[rbx]           ; it is last - first = n * delta
    cdq                     ; expand eax to edx:eax
    idiv esi                ; now: eax = delta
    ; Simple linear search in the array is fast enough.
    ; (Binary search would be faster.)
    mov ecx, eax            ; ecx = delta
    mov eax, [rbx]          ; eax = current value
    xor rdi, rdi            ; rdi = index
.loop:
    inc edi                 ; next index
    add eax, ecx            ; next value
    cmp [rbx+rdi*4], eax
    jne .exit               ; this is the missing the value
    cmp edi, esi
    jb .loop                ; until last element
.error_exit:
    xor eax, eax            ; error exit, return 0
.exit:
    ret
; ---------> endof find_missing <---------
