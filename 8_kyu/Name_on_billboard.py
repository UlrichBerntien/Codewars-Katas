def billboard(name, price=30):
    accu = 0
    for _ in name:
        accu += price
    return accu