def count_squares(cuts :int) -> int:
    """
    Calculates outer cubes of a root-cube cutted 'cuts' times.
    """
    if cuts < 0:
        # argument out of range
        return 0
    # Calculate number of all cubes and the number of inner cubes
    total_cubes = (cuts+1)**3;
    inner_cubes = (cuts-1)**3 if cuts > 1 else 0
    # Return the number of cubes in the shell
    return total_cubes - inner_cubes;    
