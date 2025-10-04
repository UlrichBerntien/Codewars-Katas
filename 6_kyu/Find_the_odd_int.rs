use std::collections::HashSet;

fn find_odd(arr: &[i32]) -> i32 {
    // Set of all integers seen 1, 3, 5, .. times in the array.
    let mut odd_integers = HashSet::new();
    for it in arr {
        if odd_integers.contains(it) {
            odd_integers.remove(it);
        } else {
            odd_integers.insert(it);
        }
    }
    if let Some(result) = odd_integers.iter().next() {
        **result
    } else {
        panic!("No int was odd times in the array.")
    }
}
