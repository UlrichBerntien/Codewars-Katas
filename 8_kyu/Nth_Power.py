def index(array, n):
    if isinstance(n,int) and n in range(len(array)):
        return array[n]**n
    else:
        return -1