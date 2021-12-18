reverse() {
  result=""
  while [[ $# -ge 1 ]]; do
    result="$1 $result"
    shift
  done
  echo "$result"
}

reverse $1