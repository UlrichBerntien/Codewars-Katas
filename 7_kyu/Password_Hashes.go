package kata

import(
  "crypto/md5"
  "encoding/hex"
  "io"
      )

func PassHash(str string) string {
    hashing := md5.New()
    io.WriteString(hashing, str)
    hashNumber := hashing.Sum(nil)
    return hex.EncodeToString(hashNumber)
}