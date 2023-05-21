"""
  Returns 0 if the capacity is enough or the missing capacity.
  cap = capacity, on = already used, wait = next needed.
"""
enough(cap::Integer, on::Integer, wait::Integer) = max(0, on+wait-cap)
