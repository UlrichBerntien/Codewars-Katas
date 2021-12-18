from collections import Counter

def points(dice: str) -> int:
    counts = sorted( Counter(dice).values() )
    if len(counts) < 3:
        return counts[-1] * 10
    elif len(counts) == 5 and '23456'.find(''.join(sorted(dice)).strip('1')) >= 0:
        return 20
    else:
        return 0
