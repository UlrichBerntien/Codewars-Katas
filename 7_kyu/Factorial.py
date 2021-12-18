# Table lookup is faster than multiplications.
FACTORIAL_TABLE = (
	1,
	1,
	2,
	6,
	24,
	120,
	720,
	5040,
	40320,
	362880,
	3628800,
	39916800,
	479001600)

def factorial(n :int) -> int:
    if type(n) is int and 0 <= n <= 12:
        return FACTORIAL_TABLE[n]
    else:
        raise ValueError