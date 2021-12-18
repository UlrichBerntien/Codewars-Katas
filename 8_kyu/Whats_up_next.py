def next_item(xs, item):
    xsi = iter(xs)
    try:
        for x in xsi:
            if x == item:
                return next(xsi)
    except StopIteration:
        return None
