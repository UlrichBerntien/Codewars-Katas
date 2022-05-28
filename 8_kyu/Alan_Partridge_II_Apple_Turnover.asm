SECTION .text
global apple

apple:
  ; x = edi
  ; put result string into rax
  mov rax, str_cold
  mov rcx, str_hot
  cmp edi, 31         ;it is 31² = 961 , 32² = 1024
  cmovg rax, rcx
  cmp edi, -31
  cmovl rax, rcx
  ret

section .data
  str_cold db "Help yourself to a honeycomb Yorkie for the glovebox.",0
  str_hot db "It's hotter than the sun!!", 0
