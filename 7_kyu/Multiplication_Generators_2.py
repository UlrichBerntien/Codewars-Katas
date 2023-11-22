from typing import Generator

def generator(lhs: int) -> Generator[str,None,None]:
    """
    Generator of strings, lines of the multiplaction table with given lhs.
    """
    # right hand side of the product 1, 2, ...
    rhs = 1
    # value of the product, fast calculated by sum
    prod = lhs
    # left hand side of the yield string is always the same 
    lhss = f"{lhs} x "
    while True:
        yield f"{lhss}{rhs} = {prod}"
        rhs += 1
        prod += lhs
