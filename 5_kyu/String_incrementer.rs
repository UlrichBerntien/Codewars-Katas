// Increments last decimal number in the string.
// Appends number '1' as no number is at the end.
fn increment_string(s: &str) -> String {
    let mut accu: Vec<char> = s.chars().collect();
    let mut i: usize = accu.len();
    let mut inc: bool = true;
    while inc && i > 0 && accu[i - 1].is_ascii_digit() {
        // Increment the decimal number at the end
        i -= 1;
        if accu[i] == '9' {
            accu[i] = '0';
        } else {
            accu[i] = char::from_u32(accu[i] as u32 + 1).unwrap();
            inc = false;
        }
    }
    if inc {
        // insert new digit (overflow of existing number or new number)
        accu.insert(i, '1');
    }
    String::from_iter(accu)
}
