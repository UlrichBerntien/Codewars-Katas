.globl counting_valleys

# int counting_valleys(const char *)
# Count number ov passed valleys.
# A valley is passed if the start level is reached again.
counting_valleys:
    mv t0, a0         # t0 := current address in array
    li t1, 0          # t1 := current level, initial 0
    li t2, 'U'        # t2 := constant, up step
    li t3, 'D'        # t3 := constant, down step
    li a0, 0          # a0 := valley counter, initial 0
    beqz t0, .exit    # NULL pointer: exit
.loop:    
    lb t4, (t0)       # load next step (char)
    addi t0, t0, 1
    bne t4, t2, .no_up
    # current char is up step
    addi t1, t1, 1    # current level goes up
    bnez t1, .loop
    addi a0, a0, 1    # now out of a valley
    j .loop
.no_up:
    bne t4, t3, .next
    # current char is down step
    addi t1, t1, -1   # current lebel goes down
    j .loop
.next:
    bnez t4, .loop    # do while not end of string
.exit:    
    ret
