use std::cmp::Reverse;
use std::collections::BinaryHeap;

// Returns smallest number not in ids.
fn next_id(ids: &[usize]) -> usize {
    let mut heap: BinaryHeap<Reverse<usize>> = ids.iter().map(|&x| Reverse(x)).collect();
    let mut candidate = 0usize;
    while let Some(Reverse(x)) = heap.pop() {
        if candidate < x {
            return candidate;
        } else {
            candidate = x + 1;
        };
    }
    candidate
}
