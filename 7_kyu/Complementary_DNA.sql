-- Generates table
--    dna = given DNA code as string
--    res = calculated complementary DNA of dna as string
SELECT
  dna,
  translate(dna,'ATCG','TAGC') AS res
FROM dnastrand;
