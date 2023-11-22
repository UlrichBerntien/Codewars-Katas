import functools as fun
import operator

def strong_enough(earthquake :list[list[int]], age: int) -> str:
    """
    Calculates if the build is safe acording the given earthquake.
    earthquake -- Data of the earthquake, list of shockware, each list of tremors
    age -- Age of the building in years
    """
    # magnitude of the earthquake
    magnitude = mul( sum(shockwave) for shockwave in earthquake )
    # building starts at 100 with 1% decay year
    limit = 1000. * pow(0.99,age)
    return "Safe!" if magnitude <= limit else "Needs Reinforcement!"

def mul(factors :list[int]) -> int:
    """Returns product of all numbers in the list."""
    return fun.reduce( operator.mul, factors, 1)
