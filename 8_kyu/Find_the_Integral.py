def integrate(coefficient: int, exponent: int) -> str:
    integral_exponent = exponent+1
    integral_coefficient = coefficient//integral_exponent
    return f"{integral_coefficient}x^{integral_exponent}"