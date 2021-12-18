def sort_sequence(sequence):
    # split into sublists
    lists = []
    start_index = 0
    while start_index < len(sequence):
        stop_index = sequence.index(0,start_index)
        lists.append(sequence[start_index:stop_index])
        start_index = stop_index+1
    # sort sublists, python standard sort function is stable
    lists.sort( key=sum )
    result = []
    # combine sublists with each sublist sorted
    for lst in lists:
        lst.sort()
        result = result + lst + [0]
    return result