// Returns sum of start, start+step, start+2*step, ..., end.
fn sequence_sum(start: u32, end: u32, step: u32) -> u32 {
    if end < start {
        // no numbers to add
        return 0;
    };
    // Gauss summation formula
    let number_steps = (end - start) / step;
    // intermediate product in u64 to avoid overflow
    let num = number_steps as u64;
    let n = ((num * (num + 1)) / 2) as u32;
    n * step + (number_steps + 1) * start
}
