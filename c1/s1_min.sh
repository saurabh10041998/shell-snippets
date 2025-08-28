#! /bin/bash
# print_path splits path on ':' and prints each component newline

function print_path() {
  local path="$PATH"
  
  OLDIFS=$IFS
  IFS=":"
  for directory in $path; do
    echo "$directory"
  done
  IFS=$OLDIFS
}

print_path
