SECTION .text
global get_count


; Returns the number of vowels in a 8-bit ASCII zero string.
; Vowels are aeiou.
; argument RDI: (const char*) The string to count the vowels of.
; return EAX:  (uint32_t)    The number of vowels.
get_count:
  xor eax, eax      ; r8d := vowel counter
  mov edx, 104111h  ; bit mask for vowel chars
.next:
  mov cl,[rdi]      ; load next 8-bit char
  test cl, cl       ; al == 0, end of string?
  jz .exit
  inc rdi           ; move pointer to next char
  mov ebx, edx      ; ebx := vowel bit pattern
  sar ebx, cl       ; shift vowel bit of current char into carry bit
  jnc .next
  inc eax           ; count current vowel and load next char
  jmp .next
.exit:  
  ret
