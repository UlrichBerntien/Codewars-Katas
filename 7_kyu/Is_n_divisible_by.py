def is_divisible(*args) -> bool:
    """
    Returns true if first number is divisble by the other arguments.
    """
    if not args or len(args) < 1:
        # none or only one argument
        return True
    return all( args[0] % d == 0 for d in args[1:] )
