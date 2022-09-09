# Checks if variable has the given type name.
def type_validation(variable, type_name: str) -> bool:
    return type(variable).__name__ == type_name