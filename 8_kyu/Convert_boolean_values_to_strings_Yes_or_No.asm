SECTION .text
global bool_to_word

 ; Returns "Yes" if argument is nonzero, "No" if argument is 0
bool_to_word:
  test   edi,edi
  jz     .no
  mov    rax,yes
  ret
.no:
  mov    rax,no
  ret
  
SECTION .data

yes  DB 'Yes',0
no   DB "No",0