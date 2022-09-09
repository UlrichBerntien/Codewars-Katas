.globl fix_the_meerkat

# void fix_the_meerkat(void *meerkat, size_t size)
# Swap content of item 0 and item 2 in the array meerkat.
# size is the size of ONE item in the array.
fix_the_meerkat:
    beqz a0, .exit      # NULL pointer error: exit
    mv t0, a0           # t0 = address of item 0
    add t1, a0, a1
    add t1, t1, a1      # t1 = address of item 2
    # first: swap dwords (8 bytes) if possible to reduce runtime
    li t4, 8            # t4 := unit size in bytes
    bltu a1, t4, .dword_exit
.dword_loop:    
    ld t2, (t0)         # swap one dword
    ld t3, (t1)
    sd t2, (t1)
    sd t3, (t0)
    add t0, t0, t4      # move addresses to next dwort  
    add t1, t1, t4
    sub a1, a1, t4      # count down remaining bytes
    bgeu a1, t4, .dword_loop # do while at least 8 bytes remain
.dword_exit:
    # swap the last bytes
    li t4, 1            # t4 := unit size in bytes
    beqz a1, .exit
.byte_loop:    
    lb t2, (t0)         # swap one byte
    lb t3, (t1)
    sb t2, (t1)
    sb t3, (t0)
    add t0, t0, t4      # move addresses to next bytes
    add t1, t1, t4
    sub a1, a1, t4      # count down remaining bytes
    bnez a1, .byte_loop # do while bytes remain
.exit:
    ret
