use std::fmt::Write;

// Converts 2D array of integers into CSV formated string.
// Separates items by ',' and rows by '\n'.
fn to_csv_text(array: &[Vec<i8>]) -> String {
    if array.is_empty() || array[0].is_empty() {
        return String::new();
    }
    let last_row = array.len() - 1;
    let last_col = array[0].len() - 1;
    // estimate capacity with 3 decimals per number
    let mut accu = String::with_capacity((last_row + 1) * (last_col + 1) * 4);
    for (row, numbers) in array.iter().enumerate() {
        assert!(numbers.len() == last_col + 1);
        for (col, item) in numbers.iter().enumerate() {
            write!(accu, "{}", item).expect("out of memory");
            if col < last_col {
                accu.push(',')
            } else if row < last_row {
                accu.push('\n')
            }
        }
    }
    accu
}
