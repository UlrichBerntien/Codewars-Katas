fn count_sheep(n: u32) -> String {
    let mut result = String::new();
    for i in 1..=n {
        result += &i.to_string();
        result += " sheep...";
    }
    result
}