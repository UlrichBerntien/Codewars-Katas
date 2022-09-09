.globl to_upper_case

# void to_upper_case(const char *str, char *out)
# Copies string vom 'str' into buffer 'out'.
# Changes lowver case letter into upper case.
# Supports ASCII character set only. NO ASCII extensions are supported.
to_upper_case:
    beqz a0, .exit        # if NULL pointer: exit
    beqz a1, .exit
    li t1, 'a'            # characters constants
    li t2, 'z'            #   a..z the ASCII lower case letters.
.loop:    
    lb t0, (a0)           # read next char from str
    addi a0, a0, 1
    bltu t0, t1, .store
    bltu t2, t0, .store
    addi t0, t0, 'A'-'a'  # convert lower to upper case
.store:
    sb t0, (a1)           # write next char in output buffer
    addi a1, a1, 1
    bnez t0, .loop        # repeat while not end of string
.exit:
  ret
