global testit

testit:
  popcnt rax, rdi ; count of bits with value 1 in the parameter number
  ret