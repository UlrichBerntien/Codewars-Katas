def dots_on_domino_bones(n: int) -> int:
    if n < 0:
        return 0
    sum = 0
    for i in range(n+1):
        p = (i+1)*i
        sum += p + p/2
    return sum