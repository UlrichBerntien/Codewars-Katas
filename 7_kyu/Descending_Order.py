# Returns a integer with all decimal digits from argument num sorted downwards.
def descending_order(num: int) -> int:
    return int("".join(sorted(str(num), reverse=True)))
