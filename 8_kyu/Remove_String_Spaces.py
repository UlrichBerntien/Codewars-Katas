def no_space(x: str) -> str:
    """Returns string with all spaces removed"""
    return x.translate(space_remover)

# String mapping table to remove spaces.
space_remover = str.maketrans("", "", " \t\r\n")
