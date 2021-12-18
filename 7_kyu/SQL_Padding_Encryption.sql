SELECT
    rpad(md5,64,'1') AS md5,
    lpad(sha1,64,'0') AS sha1,
    sha256
FROM encryption;