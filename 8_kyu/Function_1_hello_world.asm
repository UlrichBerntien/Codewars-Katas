SECTION .text
global greet

;  Return "Hello World!"
greet:
  mov rax, text
  ret
  
SECTION .data
text  DB "Hello World!",0