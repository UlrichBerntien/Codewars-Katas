from typing import List

def divisible_by(numbers: List[int], divisor: int) -> List[int]:
    return list(filter(lambda x: x % divisor == 0, numbers))