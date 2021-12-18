def max_diff(lst):
    try:
        return max(lst)-min(lst)
    except ValueError:
        return 0