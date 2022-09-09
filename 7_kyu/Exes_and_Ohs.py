# Returns true if the number of x and o letters are equal.
# Ignores other characters, compares case insensitive.
def xo(s: str) -> bool:
    xplus_ominus: int = 0
    for c in s.casefold():
        if c == 'x':
            xplus_ominus += 1
        elif c == 'o':
            xplus_ominus -= 1
    return xplus_ominus == 0