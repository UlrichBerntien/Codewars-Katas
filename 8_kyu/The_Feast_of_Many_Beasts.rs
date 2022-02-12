fn feast(beast: &str, dish: &str) -> bool {
    let beast_chars: Vec<char> = beast.chars().collect();
    let dish_chars: Vec<char> = dish.chars().collect();
    beast_chars[0] == dish_chars[0]
    && beast_chars[beast_chars.len()-1] == dish_chars[dish_chars.len()-1]
}