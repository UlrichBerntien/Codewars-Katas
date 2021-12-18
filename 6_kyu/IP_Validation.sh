validate_IPv4 () {
  local pattern='([1-9][0-9]*)\.([1-9][0-9]*)\.([1-9][0-9]*)\.([1-9][0-9]*)'
  local index
  if [[ $1 =~ $pattern ]]; then
    for index in {1..4}; do
      if [[ ${BASH_REMATCH[$index]} -gt 255 ]]; then
        return 1
      fi
    done
  else
    return 1
  fi
  return 0
}

if validate_IPv4 "$1"; then
  echo 'True'
else
  echo 'False'
fi