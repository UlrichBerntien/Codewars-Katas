def feast(beast :str, dish :str) -> bool:
    if not beast or not dish:
        # Special case: a name is empty
        return false
    return beast[0] == dish[0] and beast[-1] == dish[-1]