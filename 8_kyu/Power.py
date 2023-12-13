def number_to_pwr(number: float, p: int) -> float:
    """
    Returns number raise by p.
    Implementation does not use a library.
    """
    result = 1
    if p < 0:
        number = 1/number
        p = -p
    # Exponentiation by squaring algorithm
    while p > 0:
        if p & 1:
            result *= number
        p //= 2
        number *= number
    return result
