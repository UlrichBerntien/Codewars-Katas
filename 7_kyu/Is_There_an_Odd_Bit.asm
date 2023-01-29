global anyodd

; <-- EAX anyodd(EDI x) -->
anyodd:
    test edi,0xAAAAAAAA
    setne al
    movzx eax,al
    ret
; -----> endof anyodd <-----