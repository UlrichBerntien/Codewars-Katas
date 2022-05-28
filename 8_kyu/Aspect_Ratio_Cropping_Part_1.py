from typing import Tuple

FIXED_RATIO = (16, 9)

def aspect_ratio(x: int, y: int) -> Tuple[int, int]:
    return (y * FIXED_RATIO[0] + FIXED_RATIO[1]-1)//  FIXED_RATIO[1], y
