section .text
global get_perimeter 
get_perimeter:            ; int get_perimeter(int length, int width)
                          ; input:  rdi = length, rsi = width
                          ; output: rax
  mov rax, rdi            ; rax = length
  add rax, rsi            ; rax += width
  sal rax, 1              ; now is rax = (length+widrh)*2
  ret