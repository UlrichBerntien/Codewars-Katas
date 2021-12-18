def quadratic_gen(a, b, c, start=0, step=1):
    i = start
    while True:
        yield [i, ((a*i)+b)*i+c]
        i += step
