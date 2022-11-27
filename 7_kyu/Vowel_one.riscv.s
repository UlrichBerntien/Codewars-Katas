  .section .text
  .global vowel_one

# Replace vowels by "1" and all other chars by "0".
# C Prototype:
#   char* vowel_one(const char* input, char* output)
# Arguments:
#   input - The string to process.
#   output - Buffer to store the result, at least sizeof input.
# Return:
#   the output string.
# This implementation supports ASCII charset only.
vowel_one:
    mv t0, a0         # t1 = pointer in input string, source
    mv t1, a1         # t2 = pointer in output buffer, destination
    mv a0, a1         # return the output buffer
    beqz t1, exit     # null pointer buffer -> return null
    beqz t0, end      # null input -> return ""
    # cache all constants in registers
    li t5, 1
    li t6, 0x20       # ASCII lower case letters bit
    li a1, 'a'        # all vowels
    li a2, 'e'
    li a3, 'i'
    li a4, 'o'
    li a5, 'u'
    li a6, '1'        # resulting characters
    li a7, '0'
    j loop_condition
loop:    
    or t3, t6, t3         # char to lower
    mv t4, a6             # t4 = '1' prepared for vowel
    bgt a1, t3, no_vowel
    beq t3, a1, is_vowel
    beq t3, a2, is_vowel
    beq t3, a3, is_vowel
    beq t3, a4, is_vowel
    beq t3, a5, is_vowel
no_vowel:
    mv t4, a7         # t4 = '0' no vowel
is_vowel:
    sb t4, (t1)       # store transformed character
    add t1, t5, t1    # move pointer to next char
loop_condition:
    lb t3, (t0)       # load char from input string
    add t0, t5, t0    # move pointer to next char
    bnez t3, loop     # while not end of string
end:
    sb zero, (t1)     # terminate output string
exit:
    ret
