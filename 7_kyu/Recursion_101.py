from typing import List

def solve(a: int, b: int) -> List[int]:
    while 1:
        if a == 0 or b == 0:
            return [a,b]
        a %= 2*b
        if b >= 2*a:
            b -= 2*a
        else:
            return [a,b]
    