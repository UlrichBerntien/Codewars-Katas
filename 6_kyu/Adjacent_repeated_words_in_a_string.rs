// Fast version only for ASCII string. No unicode support!
fn count_adjacent_pairs(search_string: &str) -> usize {
    let mut count_sub_string: usize = 0;
    let mut count_repeations: usize = 0;
    let mut last_sub_string = "";
    for s in search_string.split_whitespace() {
        if s.eq_ignore_ascii_case(last_sub_string) {
            count_sub_string += 1;
        } else {
            if count_sub_string > 0 {
                count_repeations += 1;
            }
            last_sub_string = s;
            count_sub_string = 0;
        }
    }
    if count_sub_string > 0 {
        count_repeations += 1;
    }
    count_repeations
}
