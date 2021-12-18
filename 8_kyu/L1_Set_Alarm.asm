global setalarm

section .text

; <--- bool setalarm(bool empl, bool vac) --->
setalarm:
    test  dil,dil        ; interpret values != 0 mean true
    setnz dil            ; dil = 1 or 0 if dil if true or false
    test  sil,sil        ; interpret values != 0 mean true
    setz  al             ; al = 0 or 1 if sil is true or false
    and   al, dil        ; bitwise and = logical and after normalization
    movzx rax, al        ; expand to rax to ensure compatibility
    ret
; ---------> endof setalarm <---------