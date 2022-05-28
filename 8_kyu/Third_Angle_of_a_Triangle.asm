SECTION .text
global otherAngle
; Returns the third angle (in degrees) of a triangle
; arg0         = (int32_t) Angle1
; arg1         = (int32_t) Angle2
; return value = (int32_t) Angle3?
otherAngle:
  mov eax, 180    ; sum of all angles = 180°
  sub eax, edi
  sub eax, esi
  ret
