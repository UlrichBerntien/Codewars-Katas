fn get_planet_name(id: u32) -> String {
    match id {
        1 => "Mercury",
        2 => "Venus",
        3 => "Earth",
        4 => "Mars",
        5 => "Jupiter",
        6 => "Saturn",
        7 => "Uranus",
        8 => "Neptune",
        _ => unreachable!(),
    }
    .to_string()
}
