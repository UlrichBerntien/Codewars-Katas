def find(r):
    number = 0
    for i in range(9,-1,-1):
        number = number*2 + (i in r)
    return number