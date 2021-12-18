import re

# Compiled PIN pattern: 4 or 6 digits
PIN_PATTERN = re.compile(r"\d{4}|\d{6}")

def validate_pin(pin: str) -> bool:
    """Returns True if and only if the pin is a valid PIN code."""
    return PIN_PATTERN.fullmatch(pin) != None