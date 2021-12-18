def find_multiples(integer, limit):
    return [it*integer for it in range(1,1+limit//integer)]