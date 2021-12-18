SECTION .text

global odd_or_even

; const char *odd_or_even(const int *array, size_t length);
odd_or_even:
    xor   al, al          ; add the LSB in LSB of al
    test  rsi, rsi        ; check length == 0
    jmp  .start
.next:
    xor   al,[rdi]         ; "add" the LSB of the int
    add   rdi, 4           ; to the next int, sizeof int = 4
    dec   rsi              ; rest length
.start:
    jnz   .next            ; until all items are "added"
    test  al, 1            ; check the LSB
    jz    .even
    mov   rax,odd
    ret
.even:
    mov   rax,even
    ret

SECTION .data

odd   DB "odd",0
even  DB "even",0
