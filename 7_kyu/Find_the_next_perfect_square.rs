// Returns nex perfect square.
// Returns None if sq is no a perfect square.
fn find_next_square(sq: u64) -> Option<u64> {
    // Calculate root of sq. Float math is fast on modern CPUs
    let mut root = (sq as f64).sqrt().floor() as u64;
    // Find the excat solution without float rounding error
    while root.pow(2) > sq {
        root -= 1
    }
    while root.pow(2) < sq {
        root += 1
    }
    if root.pow(2) != sq {
        // sq is not a perfect square
        return None;
    }
    // calculate next square
    Some((root + 1).pow(2))
}
