def reverse_number(n :int) -> int:
    rest = abs(n)
    accu = 0
    while rest > 0:
        rest,m = divmod(rest,10)
        accu = accu*10 + m
    return accu if n > 0 else -accu