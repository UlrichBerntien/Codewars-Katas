fn enough(cap: i32, on: i32, wait: i32) -> i32 {
    (on + wait - cap).max(0)
}