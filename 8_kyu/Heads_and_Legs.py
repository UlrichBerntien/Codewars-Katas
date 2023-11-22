def animals(heads: int, legs: int) -> tuple[int,int]|str:
    """
    Calculates number of chickens and cows on the farm.
    heads -- Count of all heads
    legs -- Count of all legs
    return -- Tuple of #chickens, #cows, or error message in string forma.
    """
    if not (legs >= 0 and legs%2 == 0 and legs//4 <= heads <= legs//2):
        return "No solutions"
    cows = legs//2 - heads
    chickens = heads - cows
    return chickens, cows
