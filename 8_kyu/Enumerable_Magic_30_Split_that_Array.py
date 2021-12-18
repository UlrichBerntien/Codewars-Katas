def partition(arr, classifier_method):
    lists = ([],[])
    for it in arr:
        lists[classifier_method(it)].append(it)
    return lists[::-1]
