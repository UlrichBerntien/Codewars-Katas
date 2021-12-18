def some_but_not_all(seq, pred):
    has = [False,False]
    for it in seq:
        has[bool(pred(it))] = True
        # exit as fast as possible
        if all(has):
            return True
    # sequennce is scanned with only True or False predictions.
    return False