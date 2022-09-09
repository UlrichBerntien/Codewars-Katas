.globl find_the_number_plate

# void find_the_number_plate(int id, char *number_plate)
# Generates car number plate strings based on customer id.
find_the_number_plate:
    # Plate number is a combination 3-letter-digits + 3-decimal-digits.
    # The letter digits are  0 = 'a' ... 25 = 'z', big endian
    # The decimal digits are 0 = '0' ...  9 = '9', little endian
    beqz a1, .exit      # NULL pointer error exit
    li t0, 999          # Decimal number 000 is skipped, only 999 numbers
    divu t0, a0, t0
    add a0, a0, t0
    addi a0, a0, 1
    li t0, 0            # write end of string mark
    sb t0, 6(a1)
    # write the lower 3 decimal digits
    addi a1, a1, 5      # lowest decimal digit in the buffer number_plate
    li t1, 3            # number of decimal digits to write
    li t2, 10           # digit base
    li t3, '0'          # ASCII code of digit with value 0 
.loop_decimal:
    remu t0, a0, t2     # t0 := value of last digit
    divu a0, a0, t2
    add t0, t0, t3      # convert value into ASCII code
    sb t0, (a1)         # store digit
    addi a1, a1, -1     # move to next higher decimal digit
    addi t1, t1 , -1    # count down digits
    bnez t1, .loop_decimal
    # write the upper 3 letter digits
    addi a1, a1, -2     # lowest letter digit in the buffer number_plate
    li t1, 3            # number of letter digits to write
    li t2, 26           # digit base
    li t3, 'a'          # ASCII code of digit with value 0 
.loop_letter:
    remu t0, a0, t2     # t0 := value of last digit
    divu a0, a0, t2
    add t0, t0, t3      # convert value into ASCII code
    sb t0, (a1)         # store digit
    addi a1, a1, 1      # move to next higher letter digit
    addi t1, t1 , -1    # count down digits
    bnez t1, .loop_letter
.exit:
    ret
