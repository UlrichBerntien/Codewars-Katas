def sum_mul(n :int, m :int) -> int|str:
    """
    Return sum of n,2n,3n,... below m.
    """
    if m <= 0 or n <= 0:
        return 'INVALID'
    # count of multiples of n below m
    c = (m-1) // n
    # calculate sum by Gauss formula
    return n * c * (c+1) / 2