def consecutive(arr, a, b):
    try:
        idx = arr.index(a)
        return (idx > 0 and arr[idx-1] == b) or (idx+1<len(arr) and arr[idx+1] == b)
    except:
        return False