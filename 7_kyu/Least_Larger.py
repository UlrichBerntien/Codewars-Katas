def least_larger(a, i): 
    lower = a[i]
    upper = None
    upper_index = -1
    for index, value in enumerate(a):
        if lower < value and (upper is None or value < upper):
            upper = value
            upper_index = index
    return upper_index