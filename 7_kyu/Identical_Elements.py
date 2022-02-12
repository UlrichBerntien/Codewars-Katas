def duplicate_elements(m, n):
    # simple version is fast enough
    return any(x in m for x in n)