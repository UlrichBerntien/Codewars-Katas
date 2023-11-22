def elevator_distance(array: list[int]) -> int:
    return sum( abs(a-b) for a,b in zip(array,array[1:]) )
