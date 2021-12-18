def hello(name: str = '') -> str:
    name = name.capitalize() if name else "World"
    return f"Hello, {name}!"