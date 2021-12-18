from itertools import groupby
from typing import Tuple

def longest_repetition(chars: str) -> Tuple[str,int]:
    "Character with longest consecutive repetition"
    if not (chars and type(chars) is str):
        return ('',0)
    return max(((c,len(list(g))) for c,g in groupby(chars)), key=lambda x: x[1])