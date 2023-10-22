def solution( molar_mass1 :float, molar_mass2 :float, given_mass1 :float,
    given_mass2 :float, volume :float, temp :float) -> float:
    """
    Calculation uses the Maxwell–Boltzmann Ideal Gas Model.
    molar_mass1 -- molar mass of species 1 [g/mon]
    molar_mass2 -- molar mass of species 2 [g/mol]
    given_mass1 -- mass of species 1 [g]
    given_mass2 -- mass of species 2 [g]
    volume -- volume [dm³]
    temp -- temperature [°C]
    return -- Total pressure [atm] in a vessel with two gases.
    """
    # amount of substance in the volume [mol]
    n = given_mass1 / molar_mass1 + given_mass2 / molar_mass2
    # temperature of the gas [K]
    T = temp + 273.15
    # gas constant [dm³ atm / K mol]
    R = 0.082
    # inner work in the volume
    W = n*R*T
    # pressure in the vessel [atm]
    return W/volume
