# The standard escape method in the html package does not fulfill the specification.
# Implemention based on a single regex replace function call.
import re

# Translation table of the specified special characters.
TRANSLATE = {
    "<" : "&lt;",
    ">" : "&gt;",
    '"' : "&quot;",
    "&" : "&amp;"}

# Pattern matching any special character.
RE_SPECIAL_CHAR = re.compile("|".join(re.escape(k) for k in TRANSLATE))

# Translation of a special character match.
def translate(m: re.Match) -> str:
    return TRANSLATE[m.group(0)]

def html_special_chars(data: str) -> str:
    return RE_SPECIAL_CHAR.sub(translate, data)
