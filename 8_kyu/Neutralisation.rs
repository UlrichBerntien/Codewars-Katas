/// Neutralisation of string differences.
///
/// The function returns a new string.
/// Each character is copied from s1 and s2 if the corresponding (same position) characters are the same.
/// Otherwise the character '0' is placed in the resulting string.
/// So the differences in the strings are neutralised to '0' in the result string.
fn neutralise(s1: &str, s2: &str) -> String {
    s1.chars()
    .zip(s2.chars())
    .map(|ab| if ab.0 == ab.1 {ab.0} else {'0'} )
    .collect()
}
