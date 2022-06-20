SECTION .text
global xorf

;  Returns a boolean indicating whether one of the arguments is true.
;  arg0         = (bool) A boolean.
;  arg1         = (bool) A boolean.
;  return value = (bool) true if one argument is true, else false.
xorf:
  ; arg0: interpret all values !=0 as true
  test rdi,rdi
  setnz dil
  ; arg1: interpret all values !=0 as true
  test rsi,rsi
  setnz sil
  ; after normalization to 0 or 1 use the bitwise xor
  xor dil,sil
  movzx rax,dil
  ret