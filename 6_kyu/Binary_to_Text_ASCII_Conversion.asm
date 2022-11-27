global b_to_s
extern malloc

section .text

; C prototype:
;     char *b_to_s(const char* bin)
; Converts strings of bit charaters into string of characters.
; Converts each 8 bit into one character. Bits are stored as char 0 or 1.
; Caller must free the returned string.
; <-- [byte RAX] b_to_s(ro [byte RDI] bin) -->
b_to_s:
      ; Find length of input string in RCX
      xor rcx, rcx          ; count := 0
      test rdi, rdi
      jz .count_end         ; null argument -> 0 chars
      jmp .count_check
.count_next:    
      inc rcx               ; count the "bit" char
.count_check:    
      cmp byte [rdi+rcx], 0
      jne .count_next       ; not end of string (0) -> next char
.count_end:
      ; Allocate buffer for output string, pointer stored in RAX
      push rdi
      sub sp, 8             ; align stack to 16 byte
      mov rdi, rcx
      sar rdi, 3
      add rdi, 2            ; now rdi = round up(bits / 8) + 1, chars needed in output string.
      call malloc
      add sp, 8
      pop rsi               ; rsi := pointer to input string
      test rax, rax
      jz .exit              ; no memory -> return null 
      ; Convert "bit string" into character string
      mov rdi, rax          ; rdi = next char in output string
      test rsi, rsi
      jz .read_end          ; null argument -> return empty string
      ; ... Convert 8 bits into 1 characters
.next_char:    
      mov cl, 8             ; 8 bits per char
      xor dl, dl            ; dl = accu for character bits
      jmp .read_check
.read_loop:
      sal dl, 1             ; shift bits in accu, lsb bit is current bit
.read_check:
      mov ch, byte [rsi]    ; read next "bit"
      inc rsi
      cmp ch, '0'
      je .is0
      cmp ch, '1'
      jne .read_end         ; not 0, not 1 -> end of string 0, or invalid char -> stop convert
      inc dl
.is0:
      dec cl
      jnz .read_loop        ; loop until 8 bits read
      mov byte [rdi], dl    ; store next character in output string
      inc rdi
      jmp .next_char
.read_end:
      ; Append end of string char
      mov byte [rdi], 0
.exit:
      ret
; -----> endof b_to_s <-----
