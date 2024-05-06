#!/usr/bin/env bash

set -e
# Add this to see all of the commands being run
# set -x

find . -iname "*.jpg" -exec basename "{}" \; | while read i
do
  count=$(find ~/Pictures -name "$i" | wc -l)
  if [ $count -eq 0 ]; then
    echo "$i not found"
  else
    if [ $DELETE ]; then
      echo "$i found, deleting"
      find . -iname "$i" -delete
    else
      echo "$i found $(find ~/Pictures -name "$i")"
    fi
  fi
done

find . -iname "*.mp4" -exec basename "{}" \; | while read i
do
  count=$(find ~/Pictures -name "$i" | wc -l)
  if [ $count -eq 0 ]; then
    echo "$i not found"
  else
    if [ $DELETE ]; then
      echo "$i found, deleting"
      find . -iname "$i" -delete
    else
      echo "$i found $(find ~/Pictures -name "$i")"
    fi
  fi
done

