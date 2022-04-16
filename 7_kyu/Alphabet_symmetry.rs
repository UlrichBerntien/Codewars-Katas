// Count the number of chars with the same position in the string as in the alphabet.
fn count_alphabetics(str: &str) -> usize {
    str.chars()
        .zip('a'..'z')
        .filter(|(s, c)| (*s).to_ascii_lowercase() == *c)
        .count()
}

fn solve(strings: &[String]) -> Vec<usize> {
    strings.iter().map(|str| count_alphabetics(str)).collect()
}
