import re

def fix(paragraph: str) -> str:
    to_upper = lambda match: match.group(0).upper()
    return re.sub(r"^\w|\.\s*\w", to_upper, paragraph)