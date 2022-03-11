fn riders(stations: &Vec<u32>) -> u32 {
    const MAX_RIDER_DISTANCE: u32 = 100;
    let mut number_of_riders: u32 = 1;
    let mut current_rider_distance: u32 = 0;
    for &distance in stations {
        current_rider_distance += distance;
        if current_rider_distance > MAX_RIDER_DISTANCE {
            current_rider_distance = distance;
            number_of_riders += 1;
        }
    }
    number_of_riders
}