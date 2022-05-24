section .text
global quarter_of
quarter_of:     ; int quarter_of(int month)
  mov eax, edi
  add eax, 2
  xor rdx, rdx
  mov ecx, 3
  div ecx
  ret