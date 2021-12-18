SECTION .text
global include

; bool include(const int* arr, size_t size, int item)
; sizeof(int) = 4
; sizeof(size_t) = 8
; input:
;    rdi - pointer to list of int
;    rsi - number of elements in the list
;    edx - value of int to seach
; output:
;    rax - true if and only if edx is in the list
include:
    test  rdi, rdi
    jz    .false        ; no array
    test  rsi, rsi
    jz    .false        ; empty array, size = 0
.loop:
    cmp  edx,[rdi]
    je   .true          ; value found
    add  rdi, 4         ; to next int
    dec  rsi            ; counter
    jnz  .loop          ; until all items comapred
.false
    xor  rax, rax       ; empty or not found: return false
    ret
.true
    mov  rax, 1         ; value found: return true
    ret
