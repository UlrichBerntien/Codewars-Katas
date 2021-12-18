from collections import Counter

def work_on_strings(a: str,b: str) -> str:
    def swap(first: str, second: str) -> str:
        first_cf = first.casefold()
        first_sc = first.swapcase()
        second_cf = second.casefold()
        second_count = Counter(second_cf)
        return "".join( first_sc[i] if second_count[first_cf[i]] & 1 else first[i] for i in range(len(first_cf)) )
    return swap(a,b) + swap(b,a)