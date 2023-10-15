def multi_table(number: int) -> str :
    """
    Generates a multiplication table 1..10 times number.
    number -- base number for the multiplication table.
    return -- a string of 10 lines, each line a multiplication i*number=result as decimal numbers.
    """
    return "\n".join( f"{i} * {number} = {i*number}" for i in range(1,11) )
