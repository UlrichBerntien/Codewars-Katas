def square_digits(num):
    num = int(num)
    accu = 0
    shift = 1
    while num > 0:
        d = num % 10
        num //= 10
        d2 = d*d
        accu += d2 * shift
        shift *= 10 if d2 < 10 else 100
    return accu