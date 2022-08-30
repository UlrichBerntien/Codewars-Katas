.globl past

# int past(int h, int m, int s);
# Calculates time in milliseconds.
past:
  li  t0, 60
  mul a0, a0, t0        # hours into minutes
  add a0, a0, a1
  mul a0, a0, t0        # minutes into seconds
  add a0, a0, a2
  li  t0, 1000
  mul a0, a0, t0        # seconds into milliseconds
  ret
