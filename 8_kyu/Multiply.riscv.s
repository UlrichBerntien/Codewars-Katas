.globl multiply

# Multiplication of two integers.
# Arguments: registers a0, a1
# Return: register a0
multiply:
  mul a0, a0, a1
  ret