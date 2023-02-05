# Checks capacity
# Arguments
#   cap - capacity
#   on - already used from capacity
#   wait - next needed from capacity
# Return
#   0 if capacity is enough, >0 missing capacity.
def enough(cap: int, on: int, wait: int) -> int:
    return max(0,on+wait-cap)
