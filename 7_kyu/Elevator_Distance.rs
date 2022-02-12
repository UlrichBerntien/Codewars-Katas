fn elevator_distance(floors: &[i16]) -> i16 {
    floors.windows(2).map(|it| (it[0]-it[1]).abs() ).sum()
}
