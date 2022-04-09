fn last<T: Clone>(slice: &[T]) -> T {
    if slice.is_empty() {
        panic!("slice is empty")
    };
    slice[slice.len() - 1].clone()
}
