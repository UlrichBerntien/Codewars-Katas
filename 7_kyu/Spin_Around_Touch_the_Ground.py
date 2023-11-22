def spin_around(lst: list[str]) -> int:
    total = sum(1 if s=="right" else -1 for s in lst)
    return abs(total)//4