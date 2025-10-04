// Checks if isbn is a valid ISBN-10 number.
// Checks the checksum of the ISBN number.
fn valid_isbn10(isbn: &str) -> bool {
    let digits: Vec<char> = isbn.chars().collect();
    if digits.len() != 10 {
        // number of characters is not 10 => invalid ISBN-10
        return false;
    }
    let mut sum: usize = 0;
    for (i, &c) in digits.iter().enumerate() {
        let base = i + 1;
        match c {
            '0'..='9' => sum += base * (c as usize - '0' as usize),
            'X' if i == 9 => sum += base * 10,
            // invalid character in string => invalid ISBN-10
            _ => return false,
        }
    }
    // ISBN-10 checksum test
    sum % 11 == 0
}
