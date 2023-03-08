// Convert boolean value into string literal "Yes" or "No".
fn bool_to_word(value: bool) -> &'static str {
    if value {
        "Yes"
    } else {
        "No"
    }
}
