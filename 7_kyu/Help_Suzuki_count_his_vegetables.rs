use std::collections::HashMap;

fn count_vegetables(s: &str) -> Vec<(u32, String)> {
    // Prepare a HashMap with all possible vegetable names
    let mut counter: HashMap<&str, u32> = HashMap::from([
        ("cabbage", 0),
        ("carrot", 0),
        ("celery", 0),
        ("cucumber", 0),
        ("mushroom", 0),
        ("onion", 0),
        ("pepper", 0),
        ("potato", 0),
        ("tofu", 0),
        ("turnip", 0),
    ]);
    // Count the vegetables word in the string
    s.split_whitespace().for_each(|word| {
        if let Some(count) = counter.get_mut(word) {
            *count += 1
        }
    });
    let mut result: Vec<(u32, &str)> = counter
        .iter()
        .filter(|(_, &count)| count > 0)
        .map(|(&s, &c)| (c, s))
        .collect();
    // Sort descending by first element count and then by second element name
    result.sort_unstable_by(|a, b| b.cmp(&a));
    // Return Strings in the Vector
    result.iter().map(|(c, s)| (*c, s.to_string())).collect()
}
