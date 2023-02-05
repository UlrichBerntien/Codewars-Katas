from collections.abc import Iterable
from functools import reduce

# Returns the only odd-time int in the seq.
# All integers in seq must exists 2, 4, 6, .. times in seq without one integer.
# The function returns this integer.
def find_it(seq: Iterable[int]) -> int:
    # it is a xor a == 0
    return reduce(int.__xor__, seq, 0)
