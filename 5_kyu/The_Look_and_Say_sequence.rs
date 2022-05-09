use itertools::Itertools;
use std::mem;

// Store the integer in a vector digit by digit.
// Big endian format, decimal values, 0..9 per digit.
type Integer = Vec<u8>;

// Append the number at the Integer vector buffer.
fn append(buffer: &mut Integer, number: usize) {
    let index = buffer.len();
    let mut remainder = number;
    while remainder > 0 {
        buffer.insert(index, (remainder % 10) as u8);
        remainder /= 10;
    }
}

// Calculate next integer.
// Store the integer in the given buffer.
fn say_next(buffer: &mut Integer, current: &Integer) {
    buffer.clear();
    for (count, digit) in current.iter().dedup_with_count() {
        append(buffer, count);
        buffer.push(*digit);
    }
}

fn get_lines(n: usize) -> String {
    // collect the result in this string
    let mut result: String = String::with_capacity(n * n);
    // Use two Integers to store all integers without new allocating vectors.
    let mut last: Integer = Integer::new();
    let mut current: Integer = vec![1];
    for _ in 0..n {
        if !result.is_empty() {
            result.push(',');
        }
        result.extend(
            current
                .iter()
                .map(|it| char::from_digit(*it as u32, 10).unwrap()),
        );
        say_next(&mut last, &current);
        mem::swap(&mut last, &mut current);
    }
    result
}
