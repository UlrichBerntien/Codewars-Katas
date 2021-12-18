def all(seq, fun):
    for it in seq:
        if not fun(it):
            return False
    return True