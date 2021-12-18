SECTION .text
global xorf

;  Returns a boolean indicating whether one of the arguments is true.
;  arg0         = (bool) A boolean.
;  arg1         = (bool) A boolean.
;  return value = (bool) true if one argument is true, else false.
xorf:
  ; arg0: interpret all values !=0 as true
  test rdi,rdi
  jz arg0_false
  mov dil,1
  ; arg1: interpret all values !=0 as true
arg0_false:
  test rsi,rsi
  jz arg1_false
  mov sil,1
arg1_false:
  ; after normalization to 0 or 1 use the bitwise xor
  xor dil,sil
  movzx rax,dil
  ret