#!/bin/bash

# inpath --verifies that a specified program is either valid as is
#   or can be found in $PATH directory list

function in_path() {
  cmd="$1" ourpath="$2" result=1
  oldIFS=$IFS
  IFS=":"
  for directory in $ourpath; do
    if [ -x "$directory/$cmd" ]; then
      result=0
      break
    fi
  done
  IFS=$OLDIFS
  return $result
}

function checkForCmdInPath() {
  var="$1"

  if [ "$var" != "" ]; then
    if [ "${var:0:1}" = "/" ]; then
      if [ ! -x $var ]; then
        return 1
      fi 
    elif ! in_path $var "$PATH"; then
      return 2
    fi
  fi
}
