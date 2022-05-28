global length, count

struc node
    .data:  resd 1
    alignb  8
    .next:  resq 1
endstruc

section .text

; <--- size_t length(struct node *list) --->
length:
    xor rax, rax            ; RAX <- the result
    jmp .start_loop         ; 0 element list possible
.loop:
    inc rax                 ; count node
    mov rdi, [rdi+node.next]
.start_loop:
    test rdi, rdi
    jnz  .loop              ; not null, pointer to an node
    ret
; ---------> endof length <---------

; <--- size_t count(struct node *list, int data) --->
count:
    xor rax, rax            ; RAX <- the result
    jmp .start_loop         ; list could be empty
.loop:
    cmp esi, [rdi+node.data]
    jne .not_equal
    inc rax                 ; count this node
.not_equal:
    mov rdi, [rdi+node.next]
.start_loop:
    test rdi, rdi
    jnz  .loop              ; not null, pointer to an node
    ret
; ---------> endof count <---------
