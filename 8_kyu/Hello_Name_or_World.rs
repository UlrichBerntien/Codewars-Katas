fn to_title(s: &str) -> String {
    let mut it = s.chars();
    match it.next() {
        None        => String::new(),
        Some(first) => format!("{}{}", first.to_uppercase(), it.as_str().to_lowercase() ),
    }
}

fn hello(name: &str) -> String {
    let who = if name.len() > 0 {
        to_title(name)
    } else {
        String::from("World")
    };
    format!("Hello, {}!",who)
}
