fn page_digits(pages: u64) -> u64 {
    let mut digits_sum: u64 = 0;
    let mut last_page_in_sum: u64 = 0;
    let mut digits: u64 = 1;
    let mut up_to_page: u64 = 9;
    while pages > up_to_page {
        digits_sum += digits * (up_to_page - last_page_in_sum);
        last_page_in_sum = up_to_page;
        digits += 1;
        up_to_page = up_to_page * 10 + 9;
    }
    digits_sum + digits * (pages - last_page_in_sum)
}
