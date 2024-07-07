def shortest_steps_to_num(num: int) -> int:
    """
    Calculates the minimal number of operations to reach num by +1 or *2 steps.
    """
    if not isinstance(num,int) or num < 1:
        raise ValueError("argument must be a positive integer")
    # Attention: value 1 -> 0 operations
    # "num.bit_length()-1" = number of *=2 operations
    # "num.bit_count()-1" = number of +=1 operations
    return num.bit_length()-1 + num.bit_count()-1
