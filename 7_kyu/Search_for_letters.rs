fn change(string: &str) -> String {
    let mut atoz = ['0'; 26];
    for c in string.chars().filter(char::is_ascii_alphabetic) {
        let index = (c as usize & 0x5F) - 'A' as usize;
        atoz[index] = '1';
    }
    atoz.iter().collect()
}
