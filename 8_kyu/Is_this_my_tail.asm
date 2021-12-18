SECTION .text
global correct_tail

; input:
;    rdi - pointer to ASCII zero string
;    rsi - pointer to last char to check
; output:
;    rax - true if and only if last char in string is the given char.
correct_tail:
  xor rax,rax        ; rax = 0 == false and also al == '\0'
  xor rcx,rcx
  dec rcx            ; rcx = -1
  cld
  repne scasb        ; scan for end of string ''\0'
  dec rcx            ; rcx = len of string
  jz .nok            ; string is empty
  mov sil,[rsi]      ; sil = the correct tail char
  cmp sil,[rdi-2]    ; compare last char
  jne .nok
  inc rax            ; rax = 1 == true
.nok:  
  ret