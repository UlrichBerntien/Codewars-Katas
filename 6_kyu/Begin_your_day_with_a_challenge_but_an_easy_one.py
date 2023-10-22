def one_two_three(n: int) -> list[int,int]:
    a = 0
    for _ in range(n//9): a = 10*a + 9
    if n % 9 > 0:  a = 10*a + n % 9
    b = 0
    for _ in range(n): b = 10*b + 1
    return [a, b]
    