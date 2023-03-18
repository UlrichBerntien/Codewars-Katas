// Returns true if the walk returns to the startpoint and is 10 steps long.
// Walk contains "nsew" and "NSEW" characters for each step.
fn is_valid_walk(walk: &[char]) -> bool {
    walk.len() == NEEDED_UNITS && end_position(walk) == (0, 0)
}

// Number of units to go is fixed.
const NEEDED_UNITS: usize = 10;

// Returns end position of the walk.
// Returns (North/South, East/West) coordinate. North=positiv, East=positive.
// Counts the "nsew" and "NSEW" characters in the walk, ignores all others.
fn end_position(walk: &[char]) -> (i64, i64) {
    let mut ns_position: i64 = 0;
    let mut ew_position: i64 = 0;
    for step in walk {
        match step {
            'n' | 'N' => ns_position += 1,
            's' | 'S' => ns_position -= 1,
            'e' | 'E' => ew_position += 1,
            'w' | 'W' => ew_position -= 1,
            _ => {}
        }
    }
    (ns_position, ew_position)
}
