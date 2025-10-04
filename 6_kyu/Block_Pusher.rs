// Block Pusher.
// Returns state after n steps.
fn block_pushing(lst: &[char], n: u32) -> Vec<char> {
    let n = n as usize;
    // buffer to hold the result
    let mut result: Vec<char> = vec!['-'; lst.len()];
    // Process the pushes of each pusher from right to left.
    // Each pusher moves up to n steps with the same speed.
    let mut last = lst.len();
    let mut empty_space_right = 0_usize;
    for i in (0..lst.len()).rev() {
        match lst[i] {
            '>' => {
                // number of possible steps the current pusher can go right
                let mut push_steps = n.min(empty_space_right);
                // the pushes creates empty space for a pusher on the left side of the current pusher
                empty_space_right = push_steps;
                // perform the push
                let mut dst = i + push_steps;
                for src in lst.iter().take(last).skip(i) {
                    if push_steps > 0 && *src == '-' {
                        push_steps -= 1
                    } else {
                        result[dst] = *src;
                        dst += 1;
                    }
                }
                last = i;
            }
            '-' => empty_space_right += 1,
            _ => {}
        }
    }
    // Copy the blocks with no pusher
    result[0..last].copy_from_slice(&lst[0..last]);
    result
}
