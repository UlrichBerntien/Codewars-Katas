fn get_grade(s1: u16, s2: u16, s3: u16) -> char {
    let avg = (s1 + s2 + s3) / 3;
    for (limit, grade) in [(60, 'F'), (70, 'D'), (80, 'C'), (90, 'B')] {
        if avg < limit {
            return grade;
        }
    }
    'A'
}
