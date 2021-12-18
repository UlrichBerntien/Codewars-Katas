from typing import List

def count_horses(sound_str: str) -> List[int]:
    result = []
    sound_int = [int(c) for c in sound_str]
    for index, count in enumerate(sound_int):
        if count > 0:
            result += [index+1] * count
            for i in range(index,len(sound_int),index+1):
                sound_int[i] -= count
    return result