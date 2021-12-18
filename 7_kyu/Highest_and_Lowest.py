from array import array

def high_and_low(numbers: str) -> str:
    a = array("i", map(int,numbers.split()))
    return f"{max(a)} {min(a)}"