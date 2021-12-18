SECTION .text
global litres

; int litres(double);
litres:
  cvttsd2si rax, xmm0    ; truncate hours to int
  sar rax,1              ; 1 liter per 2 hours
  ret