# Returns maximal N = a * d with n = a + d and a != d.
# Returns -1 if n < 5
def max_int_chain(n: int) -> int:
  if n < 5:
    return -1
  a = (n-1)//2
  b = n-a
  return a*b
