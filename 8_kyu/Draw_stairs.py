def draw_stairs(n: int) -> str:
    """
    Returns a ASCII art stairs with n steps.
    """
    return "\n".join( "I".rjust(i) for i in range(1,n+1) )
