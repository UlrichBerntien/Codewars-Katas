from typing import Tuple, List

def value(digits: List[int]) -> int:
    "Value of the number given by list of digits."
    accu = 0
    for digit in reversed(digits):
        accu = digit + accu*10
    # returns 0 if list is empty.
    return accu

def even_and_odd(n: int) -> Tuple[int,int]: 
    "split number into numbers with odd, even digits."
    digits = ([],[])
    while n > 0:
        n,m = divmod(n,10)
        digits[m%2].append(m)
    return tuple(value(d) for d in digits)