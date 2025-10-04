// Returns a modified passphrase.
fn play_pass(s: &str, n: u32) -> String {
    s.chars()
        .enumerate()
        .map(|(i, c)| {
            let d = if c.is_ascii_alphabetic() {
                // RULE 1: circulat shift each letter
                circular_shift_letter(c, n)
            } else if c.is_ascii_digit() {
                // RULE 2: complement to 9 each decimal digit
                complement_9(c)
            } else {
                // RULE 3: keep all other characters
                c
            };
            // RULE 4: alternating uppercase, lowercase chracters
            if i & 1 == 0 {
                d.to_ascii_uppercase()
            } else {
                d.to_ascii_lowercase()
            }
        })
        .collect::<String>()
        .chars()
        // RULE 5: reverse the string
        .rev()
        .collect::<String>()
}

// Returns letter c shifted over n positions circular in A..Z.
fn circular_shift_letter(c: char, n: u32) -> char {
    let code_a = if c <= 'Z' { 'A' as u32 } else { 'a' as u32 };
    let count_az = 'Z' as u32 - 'A' as u32 + 1;
    char::from_u32(code_a + (c as u32 - code_a + n) % count_az).unwrap()
}

// Returns complement of digit c to '9'.
fn complement_9(c: char) -> char {
    char::from_u32('9' as u32 + '0' as u32 - c as u32).unwrap()
}
