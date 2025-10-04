// Splits the argument string s into distinct substrings.
// All characters in the substring are distinct.
// It returns the length (the number of characters, not bytes)
// of the substrings in a vector.
fn split_unique_substrings(s: &str) -> Vec<usize> {
    let chars: Vec<char> = s.chars().collect();
    // Map character to index of the last occurence in the string.
    let char_last_index: std::collections::HashMap<char, usize> =
        std::collections::HashMap::from_iter(chars.iter().enumerate().map(|(i, &c)| (c, i)));
    let mut cuts: Vec<usize> = Vec::new();
    let mut index: usize = 0;
    while index < chars.len() {
        let index_cut_start: usize = index;
        let mut index_cut_end = char_last_index[&chars[index]];
        while index < index_cut_end {
            index += 1;
            index_cut_end = index_cut_end.max(char_last_index[&chars[index]]);
        }
        cuts.push(index_cut_end + 1 - index_cut_start);
        index += 1;
    }
    cuts
}
