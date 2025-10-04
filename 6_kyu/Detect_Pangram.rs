// Number of letters
const LETTER_A: usize = 'A' as usize;
const LETTER_Z: usize = 'Z' as usize;
const LETTERS_N: usize = 1 + LETTER_Z - LETTER_A;

// Checks if string s is a pangram.
// Checks if string s contains all letters a..z.
fn is_pangram(s: &str) -> bool {
    if s.len() < LETTERS_N {
        // The string is too short to hold all letters.
        return false;
    }
    // number of not seen letters
    let mut not_seen = LETTERS_N;
    // seen letters
    let mut seen = [false; LETTERS_N];
    for c in s.chars() {
        // Ignores other letters like, öäü.
        if c.is_ascii_alphabetic() {
            // The simple to_ascii_uppercase works fpr a..z.
            let index = c.to_ascii_uppercase() as usize - LETTER_A;
            if !seen[index] {
                seen[index] = true;
                not_seen -= 1;
                if not_seen == 0 {
                    // All letters seen, exit
                    return true;
                }
            }
        }
    }
    // Not seen all letters
    false
}
