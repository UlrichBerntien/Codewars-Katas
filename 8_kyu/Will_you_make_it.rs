fn zero_fuel(distance_to_pump: u32, mpg: u32, gallons: u32) -> bool {
    let (range, overflow) = u32::overflowing_mul(gallons, mpg);
    overflow || range >= distance_to_pump
}