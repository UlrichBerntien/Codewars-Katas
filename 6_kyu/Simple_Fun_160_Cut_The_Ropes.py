from collections import Counter

def cut_the_ropes(arr):
    ropes = Counter(arr)
    numbers = [len(arr)]
    for rope_len, ropes_count in sorted(ropes.items()):
        numbers.append( numbers[-1] - ropes_count )
    numbers.pop()        
    return numbers