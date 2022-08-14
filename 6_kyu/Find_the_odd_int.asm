SECTION .text
global find_it

; Finds the number which appears an odd amount of times in an array
; arg0 rdi   = (int32_t*) The array of numbers
; arg1 rsi   = (size_t)   The length of arg0
; return eax = (int32_t)  The number which appears an odd amount of times
find_it:
  xor eax, eax          ; eax := accu
  jmp .next
.loop:
  xor eax, [rdi+4*rsi]  ; a xor a = 0 for all even integers
.next:
  dec rsi
  jge .loop             ; next integer
  ret
