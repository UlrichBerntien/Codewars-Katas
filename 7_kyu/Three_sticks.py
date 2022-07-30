# Cut 3 sticks of equal length from two sticks.
# Return the maximum possible length of the 3 sticks.
def maxlen(L1 :float, L2 :float) -> float:
    l_big, l_small = (L1, L2) if L1 > L2 else (L2, L1)
    if l_big/3 > l_small:
        # Cut longest stick into 3 sticks longer than the short stick.
        return l_big/3
    else:
        # Cut the longest stick into 2 sticks
        # and shorten the stricks to same length
        return min(l_big/2, l_small)
