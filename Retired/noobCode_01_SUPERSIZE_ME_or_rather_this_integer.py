def super_size(n: int) -> int:
    digits = list(c for c in str(n))
    digits.sort(reverse=True)
    return int("".join(digits))