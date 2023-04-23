// Interprets low byte of c as character.
fn get_char(c: i32) -> char {
    c as u8 as char
}
