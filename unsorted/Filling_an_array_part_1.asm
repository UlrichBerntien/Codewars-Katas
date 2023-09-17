SECTION .text
global fill_arr
extern malloc

; int32_t *fill_arr(size_t);
fill_arr:
  push rdi            ; save items count
  shl rdi, 2          ; 4 bytes per int32
  call malloc
  pop rdi             ; restore items count
  test rax, rax
  jz .exit            ; malloc failed
  xor rsi, rsi        ; rsi = index in the array
  jmp .check
.loop:
  mov [rax+rsi*4],esi ; fill item by item
  inc rsi
.check:
  cmp rsi, rdi    
  jb .loop            ; not end of array
.exit:
  ret
