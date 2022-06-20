# Filter list of string.
# Return list with strings of len = 4.
def friend(x: list[str]) -> list[str]:
    return list(filter(lambda it: len(it) == 4,x))
