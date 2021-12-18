def find_the_secret(f):
    for x in f.__code__.co_consts:
        if isinstance(x,str) and len(x) == 32:
            return x
    return ''