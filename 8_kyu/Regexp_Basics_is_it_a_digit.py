def is_digit(n: str) -> bool:
    return len(n) == 1 and ord('0') <= ord(n) <= ord('9')