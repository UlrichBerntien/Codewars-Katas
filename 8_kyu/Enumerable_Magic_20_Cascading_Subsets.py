from typing import List

def each_cons(lst: List, n: int) -> List[List]:
    return [lst[start:start+n] for start in range(0,len(lst)+1-n)]