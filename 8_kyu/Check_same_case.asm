global samecase

; <-- BL casegroup(DIL c) -->
; 1 = lower alpha
; 2 = upper alpha
; 3 = other
casegroup:
    cmp dil, 'A'
    jl  .no_alpha
    cmp dil, 'Z'
    ja  .no_upper
    mov bl, 2
    ret
.no_upper:
    cmp dil, 'a'
    jl  .no_alpha
    cmp dil, 'z'
    ja  .no_alpha
    mov bl, 1
    ret
.no_alpha:
    mov bl, 3
    ret
; -----> endof casegroup <-----

; <-- EAX samecase(DIL a, SIL b) -->
samecase:
    xor eax, eax
    push rsi
    call casegroup
    mov bh,bl           ; bh = casegroup of a
    pop rdi
    call casegroup      ; bl = casegroup of b
    cmp bl,3
    je .other
    cmp bh,3
    je .other
    cmp bl, bh
    jne .different
    inc eax           ; same case: return 1
.different:
    ret               ; not same case: return 0
.other:
    dec eax           ; not alpha: return -1
    ret
; -----> endof samecase <-----
