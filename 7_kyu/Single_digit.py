def count_ones(n :int) -> int:
    c = 0
    while n > 0:
        if n & 1:
            c += 1
        n >>= 1
    return c

def single_digit(n :int) -> int:
    while n > 9:
        n = count_ones(n)
    return n
