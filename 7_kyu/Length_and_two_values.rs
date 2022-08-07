// Creates vector of length n,
// filled alternated by first_value and second_value.
fn alternate<'a>(n: usize, first_value: &'a str, second_value: &'a str) -> Vec<&'a str> {
    let mut result = Vec::with_capacity(n);
    while result.len() < n {
        result.push(first_value);
        if result.len() < n {
            result.push(second_value);
        }
    }
    result
}
