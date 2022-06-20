#!/bin/bash

# Return number of files in directory
run_shell() {
  if [[ $# -lt 1 || -z $1 ]]; then
    # Error case: no directory name given
    echo 'Nothing to find'
    return
  fi
  if [[ $# -gt 1 ]]; then
    # Error case: more than one directory name given
    echo 'Error: more than 1 argument' >&2
    return
  fi
  if [[ ! -d $1 ]]; then
    # Error case: Directory does not exists
    # (a file with this name can exists)
    echo 'Directory not found'
    return
  fi
  local path
  path=$(realpath "$1")
  # Count the number of files in the directory $1
  local files
  files=$(find "$path" -type f -maxdepth 1 -printf F)
  echo "There are ${#files} files in $path"
}

run_shell "$1"
