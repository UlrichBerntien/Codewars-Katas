// Returns like message in the defined format.
fn likes(names: &[&str]) -> String {
    match names {
        [] => "no one likes this".to_string(),
        [a] => format!("{} likes this", a),
        [a, b] => format!("{} and {} like this", a, b),
        [a, b, c] => format!("{}, {} and {} like this", a, b, c),
        [a, b, r @ ..] => format!("{}, {} and {} others like this", a, b, r.len() ),
    }
}
