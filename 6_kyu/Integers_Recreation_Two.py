def prod2sum(a, b, c, d):
    firstPair = [abs(a*c + b*d), abs(b*c - a*d)]
    firstPair.sort()
    secondPair = [abs(a*c - b*d), abs(b*c + a*d)]
    secondPair.sort()
    delta = firstPair[0] - secondPair[0]
    if delta < 0:
        return [firstPair, secondPair]
    elif delta > 0:
        return [secondPair, firstPair]
    else: # delta == 0
        return [firstPair]
