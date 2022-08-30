.globl positive_sum

# int positive_sum(const int *values, size_t count);
# Sum of all positive integers in the array.
positive_sum:
    mv t0, a0         # t0 = moving pointer in array
    mv a0, zero       # a0 = current sum
    j .check          # first check for end or array
.loop:
    lw t1, (t0)       # load item from array
    blez t1, .next    # negative: to next item
    add a0, a0, t1    # positive: add this item to sum
.next:
    addi t0, t0, 4    # to next item in array
    addi a1, a1, -1   # reduce count of remaining items
.check:
    bgtz a1, .loop    # > zero remaining items?
    ret
