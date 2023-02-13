// Returns cubes sorted.
// if dir is 'R' sort ascending, else sort descending.
fn flip(dir: char, cubes: &[u32]) -> Vec<u32> {
    let mut result: Vec<u32> = cubes.to_vec();
    if dir == 'R' {
        result.sort_unstable()
    } else {
        result.sort_unstable_by(|a, b| b.cmp(a))
    }
    result
}
