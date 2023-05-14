fn are_you_playing_banjo(name: &str) -> String {
    let mut answer: String = String::with_capacity(name.len() + 20);
    answer.push_str(name);
    answer.push_str(if name.starts_with('r') || name.starts_with('R') {
        " plays banjo"
    } else {
        " does not play banjo"
    });
    answer
}
