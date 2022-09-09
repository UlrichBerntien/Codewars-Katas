.globl in_asc_order

# bool in_asc_order(const int *arr, size_t n)
# Return true if arr[i] <= arr[j] for all i < j.
#        else return false.
# It is sizeof (int) == 4, C int is Assembler word.
in_asc_order:
    beqz a0, .false     # NULL pointer error
    li t0, 1
    bgeu t0, a1, .true  # 0 or 1 elements
    slli a1, a1, 2      # a1 = offset to last+1 arr item
    add t0, a0, a1      # t0 = stop address, first item behind arr
    lw t1, (a0)         # load initial value
    addi a0, a0, 4
.loop:
    mv t2, t1           # t2 = item[i-1]
    lw t1, (a0)         # t1 = item[i]
    addi a0, a0, 4
    bgt t2, t1, .false  # invalid item order: return false
    bltu a0, t0, .loop  # repeat while current address < stop address
.true:                  # return true
    li a0, 1
    ret
.false:                 # return false
    mv a0, zero
    ret
