fn get_count(string: &str) -> usize {
    let mut vowels_count: usize = 0;
    for c in string.chars() {
        match c {
            'a'|'e'|'i'|'o'|'u' => vowels_count += 1,
            _ => {}
        }
    }
    vowels_count
}
