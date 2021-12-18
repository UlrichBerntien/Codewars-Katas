def clean_string(s: str) -> str:
    """Treat '#' character as backspace."""
    stack = []
    for c in s:
        if c == '#':
            if stack: stack.pop()
        else:
            stack.append(c)
    return ''.join( stack )