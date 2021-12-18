SELECT
  id,
  text(set_masklen(ip_address & netmask(ip_address),masklen(ip_address))) AS first_address,
  text(set_masklen(ip_address | hostmask(ip_address),masklen(ip_address))) AS last_address
FROM
  connections
ORDER BY
  id;  