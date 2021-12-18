section .text
global get_grade

%imacro ret_grade 2          ; parameters: minimal points, grade as char
    cmp   rax, %1
    jb    %%lower            ; not enough points
    mov   rax, %2            ; return this grade
    ret
%%lower:
%endmacro

; char get_grade(int a, int b, int c);
get_grade:
    lea   rax,[rsi+rdi]
    add   rax,rdx              ; rax = a+b+c
    mov   rcx, 3               ; number of values
    cqo
    div   rcx                  ; rax = mean of a,b,c
    ret_grade 90, 'A'
    ret_grade 80, 'B'
    ret_grade 70, 'C'
    ret_grade 60, 'D'
    mov   rax, 'F'
    ret
