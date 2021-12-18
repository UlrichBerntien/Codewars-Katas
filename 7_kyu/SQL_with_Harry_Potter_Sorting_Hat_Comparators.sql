SELECT *
FROM students
WHERE ('evil' in (quality1,quality2) AND 'cunning' in (quality1,quality2))
OR    ('brave' in (quality1,quality2) AND 'evil' != quality2)
OR    ('studious' in (quality1,quality2) OR 'intelligent' in (quality1,quality2))
OR    'hufflepuff' in (quality1,quality2)
ORDER BY id ASC;