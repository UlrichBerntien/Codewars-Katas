global max_multiple
section .text
max_multiple:
  mov rax, rsi
  xor rdx, rdx        ; rdx:rax = bound
  div rdi             ; rdx = bound % divisor, rax = bound / divisor
  sub rsi, rdx        ; rsi = bound - bound % divisor
  mov rax, rsi
  ret
