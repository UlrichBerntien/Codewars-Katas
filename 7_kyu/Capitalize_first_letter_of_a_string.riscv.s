.globl capitalize

# void capitalize(const char *str, char *out)
# Copies string from "str" to buffer "out".
# Changes first char from lower case letter to upper case.
# Supports ASCII letters only.
capitalize:
    beqz a1, .exit    # do nothing if one array is NULL
    beqz a0, .exit
    mv t1, a1         # save address of first out char.
    # Copy the string str -> out
.loop:                
    lb t0, (a0)       # load char from 'str'
    addi a0, a0, 1
    sb t0, (a1)       # store char in 'out'
    addi a1, a1, 1
    bnez t0, .loop    # while not \0 char
    # Change first char to upper case if it is a lower case letter
    lb t0, (t1)
    li t2, 'a'
    blt t0, t2, .exit
    li t2, 'z'
    blt t2, t0, .exit
    addi t0, t0, 'A'-'a'
    sb t0, (t1)
.exit:    
    ret
