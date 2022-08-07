global get_volume_of_cuboid

section .text

; <--- double get_volume_of_cuboid(double length, double width, double height) --->
get_volume_of_cuboid:
    ; volume is length * width * height
    mulsd xmm0, xmm1
    mulsd xmm0, xmm2
    ret
; ---------> end of cubvol <---------
