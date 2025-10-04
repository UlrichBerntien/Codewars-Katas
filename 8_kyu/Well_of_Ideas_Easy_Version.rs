/// Returns a comment based on numbers of "good" ideas.
fn well(ideas: &[&str]) -> &'static str {
    let goods = ideas.iter().filter( |&&it| it == "good" ).count();
    return match goods {
        0     => "Fail!",
        1..=2 => "Publish!",
        _     => "I smell a series!",
    }
}
