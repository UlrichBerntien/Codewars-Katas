from typing import Union

def f(n: int) -> Union[int,None]:
    if type(n) != int or n <= 0:
        return None
    return n*(n+1)//2