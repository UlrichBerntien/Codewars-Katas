def solution(pairs: dict) -> str:
    """
    Formats dictionary pairs content as string "k1 = v1,k2 = v2,...".
    """
    return ",".join(sorted(f"{k} = {v}" for k,v in pairs.items()))
