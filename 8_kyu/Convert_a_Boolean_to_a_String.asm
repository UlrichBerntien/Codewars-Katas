SECTION .data

txt_true  db 'true',0
txt_false db 'false',0

SECTION .text
global boolean_to_string

; Returns a string representation of a boolean
; arg0         = (bool)         The boolean.
; return value = (const char *) The string representation of the boolean.
boolean_to_string:
  test rdi, rdi
  jz  .false
  lea rax, [txt_true]
  ret
.false:
  lea rax, [txt_false]
  ret