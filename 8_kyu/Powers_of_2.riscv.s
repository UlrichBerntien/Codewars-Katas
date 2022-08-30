.globl powers_of_two

# void powers_of_two(size_t n, uint64_t powers[n + 1]);
# Fills array 'powers' with 2^0, 2^1, .. 2^n.
# It is sizeof (uint64_t) == 8, C unit64_t == Assembler double-word.
powers_of_two:
    addi t0, zero, 1    # t0 = 2^i
    j .store
.loop:
    addi a0, a0, -1     # reduce remaining items
    addi a1, a1, 8      # to next item in array 
    slli t0, t0, 1      # next power of 2
.store:
    sd t0, (a1)         # store 2^i in array
    bgtz a0, .loop      # while items remain in array
    ret
