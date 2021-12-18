import re

PHONE_NUMBER_REGEX = re.compile(r"\(\d{3}\) \d{3}-\d{4}")

def valid_phone_number(phone_number: str) -> bool:
    return PHONE_NUMBER_REGEX.fullmatch(phone_number) is not None
