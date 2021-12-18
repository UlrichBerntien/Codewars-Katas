SECTION .text
global how_much_i_love_you

how_much_i_love_you:
  xor   rdx, rdx
  mov   rax, rdi
  dec   rax
  mov   rcx, 6
  div   rcx                ; rdx = (rdi-1) % 6
  mov   rax,[table+rdx*8]
  ret
  
SECTION .data

text0:  db 'I love you',0
text1:  db 'a little',0
text2:  db 'a lot',0
text3:  db 'passionately',0
text4:  db 'madly',0
text5:  db 'not at all',0

table:  dq text0
        dq text1
        dq text2
        dq text3
        dq text4
        dq text5
