import re

def remove_parentheses(s: str) -> str:
    """Returns the string without the parts in parentheses."""
    while s != ( s:= re.sub( r"\([^(]*?\)", "", s ) ):
        pass
    return s