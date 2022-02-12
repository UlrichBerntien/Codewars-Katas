use std::fmt::Write;

fn multi_table(n: u64) -> String {
    let mut result = String::new();
    for i in 1..=10 {
        writeln!( result, "{} * {} = {}", i, n, i*n );
    }
    // remove the last \n
    result.pop();
    result
}