section .text
global twice_as_old

; int twice_as_old(int dad, int son)
; input:  rdi = dad, rsi = son
; output: rax
twice_as_old:
  mov rax, rdi
  sub rax, rsi
  sub rax, rsi
  jns .exit
  neg rax
.exit
  ret