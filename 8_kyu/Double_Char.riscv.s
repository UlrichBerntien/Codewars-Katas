.globl double_char

# char *double_char(const char *string, char *doubled);
# Fill doubled with the chars of 'string' doubled.
double_char:
    mv t0, a0           # t0 = moving pointer in 'string'
    mv a0, a1           # return pointer to string 'doubled'
    j .check            # start with eos check
.loop:
    sb t1, (a1)         # store char twice in 'doubled'
    sb t1, 1(a1)
    addi a1, a1, 2
.check:
    lb t1, (t0)         # load char from 'string'
    addi t0, t0, 1
    bnez t1, .loop      # next char if not end of string (\0)
    sb t1, (a1)         # terminate string 'doubled'
    ret
