-- Conversion of IP to well-formed IP addresses.
SELECT
  id,
  HOST(ip::CIDR) AS cleaned_ip
FROM ip_addresses
ORDER BY id DESC;
