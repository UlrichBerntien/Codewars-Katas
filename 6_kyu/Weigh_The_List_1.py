def weigh_the_list(a):
    n, s, z = 0, 0, sum(a)
    while (s == 0 or z == 0) and n < len(a):
        s += a[n]
        z -= a[n]
        n += 1
    return (z,)*n + (-s,)*(len(a)-n)
