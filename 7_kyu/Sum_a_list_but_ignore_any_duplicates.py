# Sums all single intergers in the list, ignores double integers.
def sum_no_duplicates(l: list[int]) -> int:
    last = 0            # the last integer added
    is_removed = False  # true if last doubled int removed
    accu = 0            # sum of all
    for it in sorted(l):
        if it != last:
            last = it
            accu += it
            is_removed = False
        elif not is_removed:
            accu -= last
            is_removed = True
    return accu
