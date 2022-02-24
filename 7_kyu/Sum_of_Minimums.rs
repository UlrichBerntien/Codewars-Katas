fn sum_of_minimums(numbers: [[u8; 4]; 4]) -> u8 {
    numbers
        .iter()
        .map(|sub| sub.iter().copied().min().unwrap_or(0))
        .sum()
}
