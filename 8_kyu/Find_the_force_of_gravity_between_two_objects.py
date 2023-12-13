def solution(arr_val: list[float,float,float], arr_unit: list[str,str,str]) -> float:
    """
    Calculates force of gravity between two objects.
    arr_val -- mass of obj 1, mass of obj 2,  distance between their centers.
    arr_unit -- unit for mass of obj 1, unit for mass of obj 2, unit for distance between their centers.
    return -- force in unit N.
    """
    if not arr_val or not arr_unit or len(arr_val) != 3 or len(arr_unit) != 3:
        raise ValueError("needs array 3 paramters")
    m1 = arr_val[0] * MASS_UNIT[arr_unit[0]]
    m2 = arr_val[1] * MASS_UNIT[arr_unit[1]]
    d = arr_val[2] * LENGTH_UNIT[arr_unit[2]]
    return CONST_G * m1 * m2 / d**2

# Dictionary of mass units
# Value is the factor to convert into unit kg
MASS_UNIT = { "kg": 1, "g": 1e-3, "mg": 1e-6, "μg": 1e-9, "µg": 1e-9, "lb":  0.453592 }

# Dictionary of length units
# Value is the factor to convert into unit m
LENGTH_UNIT = { "m": 1, "km": 1e3, "cm": 1e-2, "mm": 1e-3, "μm": 1e-6, "µm": 1e-6, "ft":  0.3048 }

# gravity constant, unit: N ⋅ kg^−2 ⋅ m^2
CONST_G = 6.67E-11
