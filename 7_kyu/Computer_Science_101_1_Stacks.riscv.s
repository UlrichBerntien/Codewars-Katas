.globl stack_push, stack_pop, stack_peek, stack_is_empty
.text

# void stack_push(Stack *stack, int data)
# Pushes the data onto the top of the stack
stack_push:
    beqz a0, 1f       # NULL pointer error: return 0
    addi sp, sp, -24  # save arguments on the stack
    sd ra, (sp)       #   save return address
    sd a0, 8(sp)      #   save "stack" pointer
    sw a1, 16(sp)     #   save data
    li a0, 16         # 16 bytes per stack item
    call malloc       # returns a0, this is the new top of stack item
    lw t1, 16(sp)     # t1 = data
    sw t1, (a0)       # store data in the top element
    ld t0, 8(sp)      # t0 = "stack" pointer
    ld t1, (t0)       # t1 = address of old top of stack item
    sd t1, 8(a0)      # store old top item as address of second item
    sd a0, (t0)       # store address of new top item 
    ld ra, (sp)
    addi sp, sp, 24   # clean up stack
1:
    ret

# int stack_pop(Stack *stack)
# Pops the top item of the stack and returns it.
# Returns 0 if the element is 0 or the stack is empty.
stack_pop:
    beqz a0, 1f       # NULL pointer error: return 0
    mv a1, a0         # Store pointer of the stack
    ld a0, (a0)       # load pointer to top of stack element
    beqz a0, 1f       # empty stack error: return 0
    lw t0, (a0)       # load value of the top element
    addi sp, sp, -16
    sd ra, (sp)
    sw t0, 8(sp)      # save value on the program stack
    ld t0, 8(a0)      # load address of the next item
    sd t0, (a1)       # the next item becomes the top item
    call free         # free the item
    lw a0, 8(sp)      # restore value from the stack 
    ld ra, (sp)
    addi sp, sp, 16
1:
    ret

# int stack_peek(const Stack *stack)
# Returns the top item of the stack.
# Returns 0 if the element is 0 or the stack is empty.
stack_peek:
    beqz a0, 1f       # NULL pointer error: return 0
    ld a0, (a0)       # load pointer to top of stack element
    beqz a0, 1f       # empty stack error: return 0
    lw a0, (a0)       # load value of the top element
1:
    ret

# bool stack_is_empty(const Stack *stack)
# Checks whether the stack is empty
# Returns True if the stack is empty
stack_is_empty:
    beqz a0, 1f       # NULL pointer error: return true
    ld a0, (a0)       # load pointer to top of stack element
    beqz a0, 1f       # no element: return true
    li a0, 0          # at least one element: return false
    ret
1:
    li a0, 1
    ret
