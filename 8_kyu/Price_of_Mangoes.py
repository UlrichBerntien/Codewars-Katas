def mango(quantity, price):
    d,m = divmod(quantity,3)
    return (d*2 + m) * price