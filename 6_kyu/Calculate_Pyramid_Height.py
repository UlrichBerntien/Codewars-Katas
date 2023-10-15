def pyramid_height(n :int) -> int:
    """
    Returns the maximum possible height of a perfectly square pyramid
    (number of complete layers) build with maximal 'n' cubes.
    """
    # current height of pyramid
    height = 0
    # stones needed for the next lower layer
    stones = 1
    # build the pyramid from top (1 stone) down to the lowest layer (a lot of stones)
    while n >= stones:
        n -= stones
        height += 1
        # number of stones needed for next lower layer
        # one row at the two sides "2 height"
        # plus one stone to fill the edge
        stones += 2*height + 1
    return height
