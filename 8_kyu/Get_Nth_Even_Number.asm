SECTION .text
global nth_even

nth_even:
  lea rax, [rdi*2-2]
  ret