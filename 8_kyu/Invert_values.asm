SECTION .text
global invert

invert:
  mov rcx, rsi                ; rcx = items to invert
  test rcx, rcx
  jz .exit                    ; array is empty
  test rdi, rdi
  je .exit                    ; null pointer to array
.loop:
  neg dword [rdi+rcx*4-4]
  loop .loop
.exit:
  ret
