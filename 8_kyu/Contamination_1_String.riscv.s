.globl contamination

# void contamination(const char *text, char mutation, char *result);
# Stores in result a string
#     with same length as strings text
#     filled with character mutation
contamination:
    j .check
.loop:
    sb a1, (a2)         # store char in result
    addi a2, a2, 1
.check:
    lb t1, (a0)         # load char from text
    addi a0, a0, 1
    bnez t1, .loop      # char \0 is end of string
    sb zero, (a2)       # terminate result string with char \0
    ret
