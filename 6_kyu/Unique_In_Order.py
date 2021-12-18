def unique_in_order_generator(iterable):
    last = None
    for x in iterable:
        if x is not last:
            last = x
            yield x

def unique_in_order(iterable):
    return [x for x in unique_in_order_generator(iterable)]