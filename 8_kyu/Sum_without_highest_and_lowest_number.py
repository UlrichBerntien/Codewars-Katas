def sum_array(arr):
    if not arr or len(arr) < 3:
        return 0
    if arr[0] < arr[1]:
        lowest, highest = arr[0:2]
    else:
        highest, lowest = arr[0:2]
    accu = 0
    for x in arr[2:]:
        if x > highest:
            accu += highest
            highest = x
        elif x < lowest:
            accu += lowest
            lowest = x
        else:
            accu += x
    return accu