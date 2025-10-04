// Compares your_points relative to arithmetic mean of class_points.
// Returns True if your_points is above the mean of class_points, else returns False.
fn better_than_average(class_points: &[u16], your_points: u16) -> bool {
    let your_points = your_points as u64;
    // add my points to the class_points because my points is NOT included in the slice
    let n = 1 + class_points.len() as u64;
    class_points
        .iter()
        .fold(your_points, |sum, &x| sum + x as u64)
        < your_points * n
}
