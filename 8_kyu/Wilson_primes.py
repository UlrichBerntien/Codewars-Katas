import math

def am_i_wilson(n: int) -> bool:
    """
    Returns True if n is a Wilson primes number.
    Warning: Slow O(n) code. See FLINT for fast solution.
    """
    return is_prime(n) and (math.factorial(n-1)+1) % (n*n) == 0

def is_prime(n: int) -> bool:
    if n < 2:
        return False
    h = int(math.sqrt(n)) + 1
    for i in range(2,h):
        if n % i == 0:
            return False
    return True
