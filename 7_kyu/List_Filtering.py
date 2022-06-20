# Filter the not-negative integers.
# Return a list if the not-negative integers.
def filter_list(l: list) -> list[int]:
    return list(filter(lambda it: isinstance(it,int) and it >= 0,l))