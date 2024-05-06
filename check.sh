#!/usr/bin/env bash

set -e

for i in $(ls *.jpg); do
  count=$(find ~/Pictures -name $i | wc -l)
  if [ $count -eq 0 ]; then
    echo "$i not found"
  else
    if [ $DELETE ]; then
      echo "$i found, deleting"
      rm $i
    else
      echo "$i found $(find ~/Pictures -name $i)"
    fi
  fi
done

for i in $(ls *.mp4); do
  count=$(find ~/Pictures -name $i | wc -l)
  if [ $count -eq 0 ]; then
    echo "$i not found"
  else
    if [ $DELETE ]; then
      echo "$i found, deleting"
      rm $i
    else
      echo "$i found $(find ~/Pictures -name $i)"
    fi
  fi
done

