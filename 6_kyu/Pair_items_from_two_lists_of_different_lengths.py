import itertools

def pair_items(iter1, iter2):
    list1 = list(iter1)
    list2 = list(iter2)
    delta_len = len(list1) - len(list2)
    if delta_len == 0:
        return [ list(zip(list1,list2)) ]
    elif delta_len > 0:
        result = []
        for sublist in itertools.combinations(list1,len(list2)):
            result.append( list(zip(sublist,list2)) )
        return result
    else:
        assert delta_len < 0
        result = []
        for sublist in itertools.combinations(list2,len(list1)):
            result.append( list(zip(list1,sublist)) )
        return result
