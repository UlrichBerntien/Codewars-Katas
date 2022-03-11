fn find_deleted_number(list: &[u16], mixed_list: &[u16]) -> Option<u16> {
    if mixed_list.len() < list.len() {
        let mut sorted_list = Vec::from(mixed_list);
        sorted_list.sort_unstable();
        // Binary search
        let mut first = 0usize;
        let mut last = mixed_list.len() - 1;
        while first < last {
            let i = (first + last) / 2;
            if list[i] == sorted_list[i] {
                first = i + 1;
            } else {
                last = i;
            }
        }
        Some(if list[last] == sorted_list[last] {
            list[last + 1]
        } else {
            list[last]
        })
    } else {
        None
    }
}
