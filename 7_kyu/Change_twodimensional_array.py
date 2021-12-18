from copy import deepcopy

def matrix(array): 
    result = deepcopy(array)
    for idx in range(len(result)):
        result[idx][idx] = 0 if result[idx][idx] < 0 else 1
    return result