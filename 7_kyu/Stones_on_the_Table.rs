fn stones_to_remove(stones: &str) -> usize {
    // Only 1 bytes characters in this string. So they could be compared byte by byte.
    let arr = stones.as_bytes();
    arr.into_iter().zip(arr[1..].into_iter()).fold( 0, |n,(a,b)| if a==b {n+1} else {n}  )
}