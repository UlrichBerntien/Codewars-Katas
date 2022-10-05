import re

# Pattern of a valid user name:
# - lowercase ASCII letters and digits plus underscore
# minimal 4, maximal 16 characters
USER_NAME_PATTERN = re.compile(r"[a-z0-9_]{4,16}")

# Validates user name.
# Returns true if the user name is valid.
def validate_usr(username: str) -> bool:
    return USER_NAME_PATTERN.fullmatch(username) is not None
