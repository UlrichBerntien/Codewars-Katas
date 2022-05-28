global get_real_floor
get_real_floor:
  mov eax, edi
  cmp eax, 0
  jle .exit
  dec eax
  cmp eax, 13
  jl .exit
  dec eax
.exit:
  ret
