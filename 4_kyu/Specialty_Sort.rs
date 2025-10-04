// Fast sorting of a large array.
// It assumes that many items are equal by cmp.
// Uses large buffers to reduce the number of item copy operations.
fn sort_fast<T: Copy + Ord>(arr: &mut [T]) {
    let n_buckets = usize::min(arr.len(), 100);
    let n_size = usize::min(arr.len() / 10, 10000);
    let mut buckets = Vec::<Vec<T>>::with_capacity(n_buckets);
    for item in arr.iter() {
        match buckets.binary_search_by(|probe| probe[0].cmp(item)) {
            Ok(index) => buckets[index].push(*item),
            Err(index) => {
                // prepare new bucket
                buckets.insert(index, Vec::<T>::with_capacity(n_size));
                buckets[index].push(*item)
            }
        }
    }
    // Combine the sorted items in the array
    let mut dest: usize = 0;
    for bucket in buckets.iter() {
        for src in bucket.iter() {
            arr[dest] = *src;
            dest += 1;
        }
    }
}
