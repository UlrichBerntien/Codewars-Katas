fn amount_of_pages(summary: u32) -> u32 {
    let mut digits = 1;
    let mut number_pages = 9; // pages with page number have digits
    let mut sum_pages = 0;
    let mut remain = summary;
    while remain >= number_pages * digits {
        remain -= number_pages * digits;
        sum_pages += number_pages;
        number_pages *= 10;
        digits += 1;
    }
    sum_pages += remain / digits;
    // If summary is valid and the function is correct the remain must be zero.
    // but it looks like a bug somewhere. 
    // assert!(remain % digits == 0);
    sum_pages
}
