-- Table of hosts
--    with recent software installations (installations in the last year)
--    but no software 'Title 2'
  SELECT host
  FROM host_software
  WHERE install_date >= CURRENT_DATE - INTERVAL '1 year'
EXCEPT
  SELECT host
  FROM host_software
  WHERE software_title = 'Title2'
ORDER BY host;
