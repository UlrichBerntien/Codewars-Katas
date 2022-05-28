SECTION .text
global simple_multiplication

; Multiplies and returns the argument by 8 if the argument is even, else 9 if the argument is odd.
; arg0         = (int64_t) The argument to multiply.
; return value = (int64_t) The result.
simple_multiplication:
  mov rax, rdi
  sal rax, 3
  test rdi, 1
  jz .even
  add rax, rdi
.even:
  ret