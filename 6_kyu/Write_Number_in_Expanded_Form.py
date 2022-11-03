# Returns integer as decimal number addition.
def expanded_form(num: int) -> str:
    result = ""
    number = str(num)
    zeros = "0" * (len(number)-1)
    for i, c in enumerate(number):
        if c != "0":
            result += " + " + c + zeros[i:]
    return result[3:]
