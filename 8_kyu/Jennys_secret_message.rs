fn greet(input: &str) -> String {
    if input == "Johnny" {
        "Hello, my love!".to_string()
    } else {
        format!("Hello, {}!", input)
    }
}
