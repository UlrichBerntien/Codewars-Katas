# Checks if n is an even number (int or float).
# Returns True if n is an integer or n is a float
#         and  n is even eles returns False.
def is_even(n) -> bool: 
    return type(n) in (int,float) and n % 2 == 0
