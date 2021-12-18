def close_to_zero(t):
    n = [int(s) for s in t.split()]
    if len(n) < 1:
        return 0
    closest = n[0]
    abs_closest = abs(n[0])
    for x in n[1:]:
        a = abs(x)
        if a < abs_closest or (a == abs_closest and x > 0):
            closest = x
            abs_closest = a
    return closest