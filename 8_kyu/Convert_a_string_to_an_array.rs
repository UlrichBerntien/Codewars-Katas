// Split s into strings by whitespace.
fn string_to_array(s: &str) -> Vec<String> {
    s.split_whitespace().map(str::to_string).collect()
}
