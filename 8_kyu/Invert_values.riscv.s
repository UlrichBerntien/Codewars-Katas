.globl invert

# void invert(int *arr, size_t size);
# Replace items in array by negative value.
# It is sizeof (int) = 4, C int = Assembler word.
.loop:
    lw t0,(a0)        # load array item
    neg t0, t0
    sw t0, (a0)       # store the negated value
    addi a0, a0, 4    # move pointer t next item
    addi a1, a1, -1   # reduce count of remaining items
invert:               # start with size check
    bltu zero, a1, .loop
    ret
