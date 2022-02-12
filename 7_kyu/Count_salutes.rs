fn count_salutes(hallway: &str) -> usize {
    let mut salutes = 0;
    let mut right_walker = 0;
    for c in hallway.chars() {
        if c == '>' {
            right_walker += 1;
        } else if c == '<' {
            salutes += 2 * right_walker;
        }
    }
    salutes
}