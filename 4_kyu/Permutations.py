import itertools
from typing import Set

def permutations(string: str) -> Set[str]:
    return set("".join(it) for it in itertools.permutations(string,len(string)))
