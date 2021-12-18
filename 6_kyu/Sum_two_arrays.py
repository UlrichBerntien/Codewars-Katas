from typing import List

def sum_arrays(array1: List[int],array2: List[int]) -> List[int]:
    def list2int(array: List[int]) -> int:
        if not array: return 0
        accu = abs(array[0])
        sign = -1 if array[0] < 0 else +1
        for x in array[1:]:
            accu = accu*10 + x
        return sign*accu
    def int2list(i: int) -> List[int]:
        if i == 0: return [0]
        sign = -1 if i < 0 else +1
        i = abs(i)
        array = []
        while i > 0:
            i,r = divmod(i,10)
            array.insert(0,r)
        array[0] *= sign
        return array
    if not array1 and not array2: return []
    return int2list( list2int(array1) + list2int(array2) )