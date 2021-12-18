def solution(a:str, b:str) -> str:
    short, long = (a,b) if len(a) < len(b) else (b,a)
    return short+long+short
