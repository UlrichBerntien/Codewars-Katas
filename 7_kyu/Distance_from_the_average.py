import statistics as stat
from typing import List

# Returns differece to arithmetic mean rounded to 2 digits.
def distances_from_average(test_list: List[float]) -> List[float]:
    m = stat.mean(test_list)
    return [round(m-x,2) for x in test_list]
