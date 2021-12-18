from functools import reduce
from typing import List

def logical_calc(array: List[bool], op: str) -> bool:
    return reduce( logical_calc.MAP[op], array )

# Mapping logical operator name to function
logical_calc.MAP = {
    "AND": bool.__and__,
    "OR" : bool.__or__,
    "XOR": bool.__xor__
}
