SECTION .text
global sum_array

; Sums all numbers in an array.
; arg0         = (const int32_t*) The array to sum.
; arg1         = (size_t)         The length of the array.
; return value = (int32_t)        The sum of all numbers in the array.
sum_array:
  xor  rax, rax         ; sum in rax
  test rdi, rdi
  jz   .exit            ; no array, null -> exit
  test rsi, rsi
  jz   .exit            ; empty array -> exit
  lea  rbx, [rdi+rsi*4] ; end of array
  mov  rdx, 4           ; 4 bytes per item
.next:
  add  eax, [rdi]       ; sum items
  add  rdi, rdx         ; to next item
  cmp  rdi, rbx         ; cmp to end of array
  jb  .next
.exit:
  ret
