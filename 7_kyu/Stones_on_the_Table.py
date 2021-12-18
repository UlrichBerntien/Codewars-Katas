import re

def solution(stones: str) -> int:
    return sum( len(part)-1 for part in re.findall(r'R+|G+|B+', stones) )