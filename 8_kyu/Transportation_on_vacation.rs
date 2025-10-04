fn rental_car_cost(d: u32) -> u32 {
    40 * d
        - match d {
            0..=2 => 0,
            3..=6 => 20,
            7.. => 50,
        }
}
