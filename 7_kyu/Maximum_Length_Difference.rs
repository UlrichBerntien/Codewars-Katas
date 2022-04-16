use itertools::Itertools;
use itertools::MinMaxResult;

// Calculate (min,max) of the character count of all strings.
// Returns -1,-1 if vector is empty.
fn minmax_str_count(a: Vec<&str>) -> (i32, i32) {
    let mm = a.iter().map(|it| it.chars().count()).minmax();
    match mm {
        MinMaxResult::MinMax(min, max) => (min as i32, max as i32),
        MinMaxResult::OneElement(x) => (x as i32, x as i32),
        _ => (-1, -1),
    }
}

fn mx_dif_lg(a1: Vec<&str>, a2: Vec<&str>) -> i32 {
    let a1range = minmax_str_count(a1);
    let a2range = minmax_str_count(a2);
    if a1range.0 < 0 || a2range.0 < 0 {
        -1
    } else {
        (a1range.1 - a2range.0).max(a2range.1 - a1range.0)
    }
}
