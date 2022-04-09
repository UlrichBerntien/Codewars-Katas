fn printer_error(s: &str) -> String {
    let mut count_all: usize = 0;
    let mut count_err: usize = 0;
    // Use of chars iterator allows UTF-8 multibyte chars in the string.
    for c in s.chars() {
        count_all += 1;
        if !('a'..='m').contains(&c) {
            count_err += 1;
        }
    }
    format!("{}/{}", count_err, count_all)
}
