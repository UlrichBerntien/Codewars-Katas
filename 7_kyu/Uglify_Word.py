def uglify_word(s :str) -> str:
    flag = True
    result = ""
    for c in s:
        if c.isalpha():
            result += c.upper() if flag else c.lower()
            flag = not flag
        else:
            result += c
            flag = True
    return result