use std::collections::BinaryHeap;

fn max_product(lst: Vec<i32>, n_largest_elements: i32) -> i32 {
    let mut heap = BinaryHeap::from(lst);
    let n = heap.len().min(n_largest_elements as usize);
    let mut accu = 1;
    for _ in 0..n {
        accu *= heap.pop().unwrap();
    }
    accu
}
