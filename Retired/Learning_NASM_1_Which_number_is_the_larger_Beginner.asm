section .text
global whichIsLarger
whichIsLarger:            ; int whichIsLarger(int a, int b)
  mov eax, edi
  cmp eax, esi
  cmovb eax, esi
  ret
