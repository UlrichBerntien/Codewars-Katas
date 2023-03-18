// Returns complementary DNA string.
// Exchanges the characterxs A<->T, C<->G. Keeps all other characters unchanged.
fn dna_strand(dna: &str) -> String {
    dna.chars()
        .map(|c| match c {
            'A' => 'T',
            'T' => 'A',
            'G' => 'C',
            'C' => 'G',
            _ => c,
        })
        .collect()
}
