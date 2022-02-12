fn pascals_triangle(n: usize) -> Vec<usize> {
    let total_size = n*(n+1)/2;
    let mut arr = Vec::<usize>::with_capacity(total_size);
    if n > 0 {
        // row 1 special case: only one element
        arr.push(1);
    }
    // index of the last row in the array, this index starts with 0.
    let mut last_row_index = 0;
    // row_index in the tiangle starts with 1.
    for row_index in 2..=n {
        // 1 at the begin of the row
        arr.push(1);
        // Sums in the middle of the row
        for i in last_row_index..last_row_index+row_index-2 {
            arr.push(arr[i]+arr[i+1]);
        }        
        // 1 at the end of the row
        arr.push(1);
        last_row_index += row_index-1;
    }
    return arr
}
