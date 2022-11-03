// Total pressure [atm] in a vessel with two gases.
// Calculation uses the Maxwell–Boltzmann Ideal Gas Model.
double total_pressure(
  const double molar_mass1,   // molar mass of species 1 [g/mon]
  const double molar_mass2,   // molar mass of species 2 [g/mol]
  const double given_mass1,   // mass of species 1 [g]
  const double given_mass2,   // mass of species 2 [g]
  const double v,             // volume [dm³]
  const double t              // temperature [°C]
) {
  // amount of substance in the volume [mol]
  const double n = given_mass1 / molar_mass1 + given_mass2 / molar_mass2;
  // temperature of the gas [K]
  const double T = t + 273.15;
  // gas constant [dm³ atm / K mol]
  const double R = 0.082;
  // inner work in the volume
  const double W = n*R*T;
  // pressure in the vessel [atm]
  return W/v;
}