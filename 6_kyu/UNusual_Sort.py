from typing import Any, Tuple

def unusual_sort(array):
    def create_pair(it: Any) -> Tuple[int,Any]:
        if isinstance(it,str):
            if it.isdigit():
                return (int(it), it) # sort like number
            else:
                return (-1, it) # sort before all numbers
        else:
            if not isinstance(it,int):
                raise ValueError('only string or int allowed')
            if it < 0:
                raise ValueError('only not negative int allowed')
            return (it,'.') # sort before string numbers
    return sorted(array,key=create_pair)
