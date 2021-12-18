def validate_code(code: int) -> bool:
    for step in (100000,10):
        while code > step: code //= step
    return code <= 3