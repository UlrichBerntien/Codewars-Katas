global utf8_strlen

section .text
utf8_strlen:
; store constants in registers
  mov ah,1000_0000b ; first multibyte value
  mov dl,1011_1111b ; last continue byte
  mov dh,1100_0000b ; mask for continue byte detection
  cld               ; parse string upwards
; initialisation of running variables in register
  mov rsi, rdi      ; rsi := Address of next byte in string
  xor ecx, ecx      ; ecx := counter of characters
; start parsing  
  jmp .next
.count:
  inc ecx           ; count a character
.next:  
  lodsb             ; al := next byte in string
  test al,al
  jz .exit          ; byte 0 => end of string
  cmp al,ah         ; multibyte char?
  jb .count         ; no, do not count this
  cmp al,dl         ; continue byte?
  jbe .error        ; continue byte without start byte -> error
  cmp al,1101_1111b ; start of 2-byte char?
  jbe .byte2
  cmp al,1110_1111b ; start 3-byte char?
  jbe .byte3
.byte4:             ; else: start 4-byte char
  lodsb
  and al,dh
  cmp al,ah         ; UTF continue byte?
  jne .error        ; no -> error
.byte3:
  lodsb
  and al,dh
  cmp al,ah         ; UTF continue byte?
  jne .error        ; no -> error
.byte2:
  lodsb
  and al,dh
  cmp al,ah         ; UTF continue byte?
  jne .error        ; no -> error
  jmp .count
.error:
  xor ecx,ecx       ; return 0 on invald multi-byte codes
.exit:
  mov eax,ecx       ; return number of chars
  ret
