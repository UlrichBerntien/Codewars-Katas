import itertools

def pair_items(iter1, iter2):
    list1 = list(iter1)
    list2 = list(iter2)
    delta_len = len(list1) - len(list2)
    if delta_len == 0:
        return [ list(zip(list1,list2)) ]
    elif delta_len > 0:
        result = []
        for idx in itertools.combinations(range(len(list1)),len(list2)):
            result.append( list(zip((list1[i] for i in idx),list2)) )
        return result
    else:
        assert delta_len < 0
        result = []
        for idx in itertools.combinations(range(len(list2)),len(list1)):
            result.append( list(zip(list1,(list2[i] for i in idx))) )
        return result
