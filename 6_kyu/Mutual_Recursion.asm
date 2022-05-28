global F
global M
section .text
; input: edi = n
; output: eax
F:
  test edi, edi
  jnz .work
  mov eax, 1        ; eax = F(0) = 1
  ret
.work:
  push rdi          ; save n
  dec edi           ; edi = n-1
  call F
  mov edi, eax      ; edi = F(n-1)
  call M
  mov ebx, eax      ; ebx = M(F(n-1))
  pop rax           ; rax = n
  sub eax, ebx
  ret

M:
  test edi, edi
  jnz .work
  xor eax, eax      ; eax = M(0) = 0
  ret
.work:
  push rdi          ; save n
  dec edi           ; edi = n-1
  call M        
  mov edi, eax      ; edi = M(n-1)
  call F
  mov ebx, eax      ; ebx = F(M(n-1))
  pop rax           ; rax = n
  sub eax, ebx
  ret
