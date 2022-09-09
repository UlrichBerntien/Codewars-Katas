.globl is_uppercase

# bool is_uppercase(const char *)
# Returns true if the letters are only upper case letters,
#         false if any lower case letter is in the string.
# Supports on ASCII character set, no extensions to the ASCII.
is_uppercase:
    beqz a0, .true      # NULL pointer: return true
    li t1, 'a'          # first lower case letter
    li t2, 'z'          # last lower case letter
.loop:
    lb t0, (a0)         # load char from string
    addi a0, a0, 1      # address of next char
    beqz t0, .true      # end of string reaced
    bltu t0, t1, .loop
    bltu t2, t0, .loop
.false:                 # char a <= c <= z found
    li a0, 0
    ret
.true:                  # return true, no lower case letter found  
    li a0, 1
    ret
