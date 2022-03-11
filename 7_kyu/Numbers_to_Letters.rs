fn convert(number: &str) -> char {
    match number.parse::<u32>() {
        Ok(29) => ' ',
        Ok(28) => '?',
        Ok(27) => '!',
        Ok(i) if i < 27 => char::from_u32('a' as u32 + 26 - i).unwrap(),
        _ => 'E',
    }
}

fn switcher(numbers: Vec<&str>) -> String {
    numbers.iter().map(|&s| convert(s)).collect()
}
