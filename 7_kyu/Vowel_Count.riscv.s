  .section .text
  .global get_count
#
# Counts the number of vowels in the string.
# Vowels are: aeiou.
# Argument: ASCII zero terminated string.
# Return: number of vowels.
#
get_count:
    li a1, 1            # constants in registers a1-a7
    li a2, 'a'
    li a3, 'e'
    li a4, 'i'
    li a5, 'o'
    li a6, 'u'
    li a7, 0x20
    mv t1, a0           # t1 = pointer walking in the string
    mv a0, zero         # counter = 0
    beqz t1, end        # null pointer argument -> end
    j next
loop:
    add t1, a1, t1      # pointer to next char in the string
    or t2, a7, t2       # convert to lower case letter
    blt t2, a2, next    # below 'a'?
    blt a6, t2, next    # above 'u'?
    beq t2, a2, vowel   # is 'a'?
    beq t2, a3, vowel   # is 'e'?
    beq t2, a4, vowel   # is 'i'?
    beq t2, a5, vowel   # is 'o'?
    beq t2, a6, vowel   # is 'u'?
    j next              # no vowel
vowel:
    add a0, a1, a0      # add vowel count
next:
    lb t2, (t1)         # load char
    bnez t2, loop       # end of string -> end
end:    
    ret
