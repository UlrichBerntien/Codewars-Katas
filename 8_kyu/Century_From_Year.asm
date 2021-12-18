section .text
global centuryFromYear
centuryFromYear:   ; int centuryFromYear(int year)
                   ; input:  edi = year
                   ; output: rax
  mov ecx,99
  mov eax,ecx
  add eax,edi
  inc ecx          ; ecx := 100
  xor edx,edx
  div ecx
  ret