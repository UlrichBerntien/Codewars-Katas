section .text
global consecutive

; int consecutive(const int arr[], size_t sz)
; Calculates the count of missing numbers in the array.
; No numbers are missing if all numbers min..max are in the array.
; CONDITION: No number is double in the array.
consecutive:
  xor eax, eax
  cmp rsi, 1
  jle .exit               ; less than 2 items in array: 0 missing
  cld                     ; read array upwards
  lea r8, [rdi+4*rsi]     ; r8 := end of array address, first behind last item
  xchg rsi, rdi           ; rsi := array, rdi := size
  lodsd
  mov ecx, eax            ; ecx := min of array items (up to current item)
  mov edx, eax            ; edx := max of array items
.loop:
  lodsd
  cmp ecx, eax
  cmovg ecx, eax          ; found new min
  cmp edx, eax
  cmovl edx, eax          ; found new max
  cmp rsi, r8
  jl .loop                ; repeat while rsi before end of array
  mov eax, edx
  sub eax, ecx
  inc eax                 ; eax := (max-min)+1, items needed
  sub eax, edi            ; eax := missing items
.exit:  
  ret
