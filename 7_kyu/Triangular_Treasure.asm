section .text
global triangular

; int triangular(int n);
; n --> edi, result --> eax
triangular:
  xor  eax, eax     ; eax = 0, error return value
  test edi, edi
  js .error         ; error case: return 0 
  mov  eax, edi     ; eax = n
  inc  edi          ; edi = n-1
  xor  rdx, rdx
  mul  edi          ; edx:eax = (n-1)*n
  sar  eax, 1       ; return (n-1)*n/2
.error:
  ret
