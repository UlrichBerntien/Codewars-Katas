def find_longest(string: str) -> int:
    spl = string.split(" ")
    return max( len(it) for it in spl )