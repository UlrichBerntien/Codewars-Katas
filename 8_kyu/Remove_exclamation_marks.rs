/// Removes all exclamations marks.
///
/// Returns a new string, a copy of the argument input without any '!'.
fn remove_exclamation_marks(input: &str) -> String {
    return input.replace("!","")
}