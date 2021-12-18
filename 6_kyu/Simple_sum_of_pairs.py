def solve(n: int) -> int:
    digisum = 0
    while n > 0:
        digi = n % 10
        if digi < 9 and digi+10 <= n:
            digi += 10
        n = (n-digi)/10
        digisum += digi
    return digisum