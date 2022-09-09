.globl bubblesort_pass

# bool bubblesort_pass(int *arr, size_t n)
# Performes one Bubble sort pass.
# Swaps all invalid sorted pairs in the array.
bubblesort_pass:
    mv t0, a0           # t0 := current address in array
    mv a0, zero         # a0 := return value, initial false
    beqz t0, .exit      # NULL array error
    li t1, 1
    bgeu t1, a1, .exit  # 0 or 1 elements
    slli a1, a1, 2      # a1 = offset to last+1 arr item
    add t3, t0, a1      # t3 := stop address, first item behind arr
    lw t1, (t0)         # load initial value
    addi t0, t0, 4
.loop:
    mv t2, t1           # t2 = item[i-1]
    lw t1, (t0)         # t1 = item[i]
    bge t1, t2, .next   # order ok, goto next element
    sw t2, (t0)         # swap the pair in the array
    sw t1, -4(t0)
    mv t1, t2
    li a0, 1            # return value = true
.next:    
    addi t0, t0, 4      # current address to next item in the array
    bltu t0, t3, .loop  # repeat while current address < stop address
.exit:
    ret
