def middle_me(N :int, X :str, Y :str) -> str: 
    return (YY:=Y*(N//2)) + X + YY if N & 1 == 0 else X