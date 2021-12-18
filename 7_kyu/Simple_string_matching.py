def solve(a: str,b: str) -> bool:
    if a.count('*') == 1:
        start,end = a.split('*')
        return b.startswith(start) and b.endswith(end) and len(a)-1 <= len(b)
    else:
        return a == b