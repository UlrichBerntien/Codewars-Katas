// Counts true items in the array sheep.
fn count_sheep(sheep: &[bool]) -> usize {
    sheep.iter().filter(|&x| *x).count()
}
