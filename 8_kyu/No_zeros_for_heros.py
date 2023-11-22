def no_boring_zeros(n: int) -> int:
    """
    Returns n stripped by all trailing 0's of the decimal number.
    """
    if n != 0:
        while n % 10 == 0:
            n //= 10
    return n
