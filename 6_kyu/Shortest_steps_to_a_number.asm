global shortest_steps_to_num

; <-- EAX shortest_steps_to_num(EDI num) -->
shortest_steps_to_num:
    xor eax, eax      ; eax = step counter, edi = num
loop:
    cmp  edi, 1
    jbe  exit         ; 1 is reached
    test edi, 1
    jz   no_dec
    dec  edi          ; +1 step
    inc  eax
no_dec:
    sar  edi, 1       ; *2 step
    inc  eax
    jmp  loop
exit:
    ret
; -----> endof shortest_steps_to_num <-----
