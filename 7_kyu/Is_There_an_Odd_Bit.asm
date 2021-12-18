global anyodd

; <-- EAX anyodd(EDI x) -->
anyodd:
    test edi,0xAAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA
    setne al
    movzx rax,al
    ret
; -----> endof anyodd <-----