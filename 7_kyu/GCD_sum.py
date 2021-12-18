def solve(s,g):
  b = s - g
  if g < 0 or b < 0 or b%g > 0:
    return -1
  else:
    return (g, b)
