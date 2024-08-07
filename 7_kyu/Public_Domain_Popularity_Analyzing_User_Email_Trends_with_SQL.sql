-- User count of public email addresses.
SELECT
  domain,
  COUNT(*) AS user_count
FROM
  -- list of all public email addresses
  public_domains
INNER JOIN
  -- list of user emails domain addresses
  (SELECT LOWER(SUBSTRING(email, '@(\S+)\S*$')) AS domain FROM users) AS used_domains
  USING (domain)
GROUP BY
  domain
ORDER BY
  user_count DESC,
  domain ASC;
