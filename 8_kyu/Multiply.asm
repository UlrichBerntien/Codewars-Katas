global multiply
section .text

; int multiply(int, int)
; Multiplication of 2 32-bit integers.
; Arguments: edi, esi
; Result: eax
multiply:
  mov eax, edi    ; eax := first argument
  mul esi         ; edx:eax := first arg * second arg
  ret             ; return eax, no overflow handling
