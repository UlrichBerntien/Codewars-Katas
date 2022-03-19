fn create_phone_number(numbers: &[u8]) -> String {
    let digits: String = numbers.iter().map(|&i| (i + b'0') as char).collect();
    format!("({}) {}-{}", &digits[0..3], &digits[3..6], &digits[6..])
}
