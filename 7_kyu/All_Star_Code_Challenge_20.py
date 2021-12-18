def add_arrays(array1, array2):
    if len(array1) != len(array2):
        raise "Input arguments are not of equal length"
    return [a+b for a,b in zip(array1,array2)]