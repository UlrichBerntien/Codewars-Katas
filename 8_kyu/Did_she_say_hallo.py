import re

HELLO_PATTERN = re.compile(
    r'\b(hello|ciao|salut|hallo|hola|ahoj|czesc)\b',
    re.IGNORECASE)

def validate_hello(greetings):
    return HELLO_PATTERN.search(greetings) is not None