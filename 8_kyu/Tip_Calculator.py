import math
from typing import Union

TIP_TO_RELATIVEVALUE = {
    "terrible": 0.00,
    "poor": 0.05,
    "good": 0.10,
    "great": 0.15,
    "excellent": 0.20
    }

def calculate_tip(amount: Union[int,float], rating: str) -> Union[int,str]:
    rating = rating.lower()
    if rating in TIP_TO_RELATIVEVALUE:
        return math.ceil(TIP_TO_RELATIVEVALUE[rating] * amount)
    else:
        return "Rating not recognised"