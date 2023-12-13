def digitize(n: int) -> list[int]:
    """
    Converts number to reversed array of digits.
    """
    if n < 0 or not isinstance(n,int):
        raise ValueError("only non-negative int possible")
    if n == 0:
        return [0]
    accu = []
    while n > 0:
        accu.append( n % 10 )
        n //= 10
    return accu
