from typing import Union

def sum_of_digits(digits: Union[int,str]) -> str:
    if type(digits) not in (int,str):
        return ""
    digits = str(digits)
    if not digits.isdigit():
        return ""
    s = sum(int(d) for d in digits)
    return " + ".join(digits) + " = " + str(s)
