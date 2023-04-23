// Return string with escaped HTML special characters.
fn html_special_chars(html: &str) -> String {
    let mut accu = String::with_capacity(html.len() * 2);
    for c in html.chars() {
        match c {
            '<' => accu.push_str("&lt;"),
            '>' => accu.push_str("&gt;"),
            '&' => accu.push_str("&amp;"),
            '"' => accu.push_str("&quot;"),
            _ => accu.push(c),
        }
    }
    accu
}
