from typing import List

def to_bytes(n: int) -> List[str]:
    result = []
    while n > 0 or not result:
        result.insert( 0, format(n & 0xff, '08b') )
        n = n >> 8
    return result