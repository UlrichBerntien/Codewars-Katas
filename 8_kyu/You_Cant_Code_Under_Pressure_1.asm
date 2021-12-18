SECTION .text
global double_integer

double_integer:
  mov rax,rdi
  sal rax,1
  ret