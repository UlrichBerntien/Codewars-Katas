.globl number_to_string

# void number_to_string(int n, char *out)
# Converts signed integer to decimal number.
# Writes string into buffer out.
# Dones not use any library function.
number_to_string:
    beqz a1, .exit    # NULL pointer error exit
    # handle sign
    bgez a0, .is_plus
    neg a0, a0
    li t0, '-'        # write sign into buffer
    sb t0, (a1)
    addi a1, a1, 1
.is_plus:
    # prepare number on stack
    mv t6, sp           # t6 := address of lowest digit
    li t5, 10           # number base
    li t4, '0'          # ASCII code for value 0
.loop_calc:
    rem t0, a0, t5      # get last digit
    add t0, t0, t4
    sb t0, (sp)         # push digit on stack
    addi sp, sp, -1
    div a0, a0, t5      # split of lowest digit
    bnez a0, .loop_calc # do while digits remain
    # copy number into buffer
.loop_copy:
    addi sp, sp, 1
    lb t0, (sp)         # pop digit from stack
    sb t0, (a1)         # copy into buffer
    addi a1, a1, 1
    blt sp, t6, .loop_copy
    sb zero, (a1)       # write end of string mark
.exit:
    ret
