fn name_shuffler(s: &str) -> String {
    match s.split_once(' ') {
        Some((left, right)) => format!("{} {}", right, left),
        _ => s.to_string(),
    }
}
