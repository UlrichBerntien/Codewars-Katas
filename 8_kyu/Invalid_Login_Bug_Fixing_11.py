INVALID_SUBSTRINGS = ("//","||")
ERROR_MESSAGE = "Wrong username or password!"

def validate(username: str, password: str) -> str:
    for input in (username,password):
        if any(s in input for s in INVALID_SUBSTRINGS):
            return ERROR_MESSAGE
    return Database().login(username,password)