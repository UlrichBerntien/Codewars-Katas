// Returns number of quadrant of the point (x,y).
fn quadrant(x: i32, y: i32) -> i32 {
    match (x < 0, y < 0) {
        (false, false) => 1,
        (true, false) => 2,
        (true, true) => 3,
        (false, true) => 4,
    }
}
