import math
from typing import Union

def logs(x: Union[int,float], a: Union[int,float], b: Union[int,float]) -> float:
    return math.log(a,x) + math.log(b,x)