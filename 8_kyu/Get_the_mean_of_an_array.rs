// Returns arithmetic mean value.
// Returns 0 if marks is empty.
fn get_average(marks: &[i32]) -> i32 {
    if marks.is_empty() {
        0
    } else {
        // use i128 arithmetik to reduce overflow risk
        (marks.iter().map(|&x| x as i128).sum::<i128>() / marks.len() as i128) as i32
    }
}
