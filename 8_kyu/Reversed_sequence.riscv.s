.globl n_to_1

# void n_to_1(int n, int *arr)
# Fills the 'arr' with n, n-1, .., 1
# It is sizeof (int) == 4, C int is assembler word
n_to_1:
    blez a0, .exit      # n <= 0: nothing to do
    beqz a1, .exit      # NULL array error: exit
.loop:
    sw a0, (a1)         # store item i in array
    addi a1, a1, 4      # pointer to next array item
    addi a0, a0, -1     # count down
    bgtz a0, .loop      # repeat while i > 0
.exit:    
    ret
