def digital_root(n: int) -> int:
    return (n-1) % 9 + 1 if n>0 else 0