# Checks capacity
# Arguments
#   cap - capacity
#   on - already used from capacity
#   wait - next needed from capacity
# Return
#   0 if capacity is enough, >0 missing capacity.
enough <- function(cap, on, wait) max(0, on+wait-cap)
