def in_array(array1, array2):
    substrings = set( filter(lambda it: any(it in s for s in array2), array1) )
    return sorted(substrings)