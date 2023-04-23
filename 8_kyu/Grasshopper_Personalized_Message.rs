// Returns greeting string.
fn greet(name: &str, owner: &str) -> String {
    String::from(if name == owner {
        "Hello boss"
    } else {
        "Hello guest"
    })
}
