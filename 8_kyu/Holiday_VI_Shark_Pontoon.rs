fn shark(
    pontoon_distance: f64,
    shark_distance: f64,
    you_speed: f64,
    shark_speed: f64,
    dolphin: bool,
) -> String {
    let dolphin_effect: f64 = if dolphin { 0.5 } else { 1.0 };
    let alive = shark_distance * you_speed > pontoon_distance * shark_speed * dolphin_effect;
    let result = if alive { "Alive!" } else { "Shark Bait!" };
    result.to_string()
}
