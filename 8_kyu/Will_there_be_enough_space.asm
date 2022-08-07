section .text
global enough

; int enough(int capacity, int used, int comming);
; Calculate number of passengers he can'take
enough:
  mov eax, edi
  sub eax, esi
  sub eax, edx      ; eax = capacity - used - comming
  jl .overload
  xor eax, eax      ; enough capacity: return 0
.overload:
  neg eax           ; too less cap: return to much passengers
  ret
