# Retungs always a negative number.
# This is not neg, a negative number is returned unchanged.
def make_negative( number: int ) -> int:
    return -number if number > 0 else number