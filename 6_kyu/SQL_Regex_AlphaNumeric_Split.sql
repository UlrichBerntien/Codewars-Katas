SELECT
  project AS project,
  translate(address,'0123456789','') AS letters,
  translate(address,'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ','') AS numbers
FROM
  repositories;