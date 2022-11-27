from collections.abc import Iterable

# Calculates journey costs.
# Parameters:
#   journey
#   Steps in tube are given by tube name string, steps in bus given by bus numter in int.
# Return:
#   Total cost as a string.
def london_city_hacker(journey: Iterable[str|int]) -> str: 
    sum_10pence = 0
    in_bus = False
    for step in journey:
        if isinstance(step,str):
            sum_10pence += 24
            in_bus = False
        elif isinstance(step,int):
            if in_bus:
                in_bus = False
            else:
                sum_10pence += 15
                in_bus = True
    return f"£{sum_10pence//10}.{sum_10pence % 10}0"
