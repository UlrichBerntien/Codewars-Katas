import collections as collect

def highest_rank(arr):
    """
    Returns the item which is most frequent in the given array.
    Returns maximal value if more than one most frequent item.
    """
    if not arr:
        # empty array
        return None
    # count the items and sort by frequency
    mc = collect.Counter(arr).most_common()
    # maximal count
    cc = mc[0][1]
    # return maximal value if more than one item with maximal count
    return max(value for value,count in mc if count == cc)
