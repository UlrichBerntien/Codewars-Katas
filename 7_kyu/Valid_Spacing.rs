fn valid_spacing(s: &str) -> bool {
    let mut last :Option<char> = None;
    for c in s.chars() {
        if c == ' ' {
            if last == None || last == Some(' ') { return false }
        }
        last = Some(c);
    }
    last != Some(' ')
}