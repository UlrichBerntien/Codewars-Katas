// Returns the number of people on the bus at the last stop.
// Argument is an array of pairs (#people in, #people out) at each stop.
fn number(bus_stops: &[(i32, i32)]) -> i32 {
    bus_stops.iter().map(|in_out| in_out.0 - in_out.1).sum()
}
