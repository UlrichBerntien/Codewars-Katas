def prev_mult_of_three(n: int) -> int:
    while n > 0:
        if n % 3 == 0:
            return n
        n = n // 10
    return None