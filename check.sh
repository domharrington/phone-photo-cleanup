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

# current total: 7688
# current total: 7505
# current total: 7310

# Missing files from ~/Pictures

# 20210916_081525.jpg not found
# 20210916_095310.jpg not found
# 20210916_095319.jpg not found
# 20210916_131335.jpg not found
# 20210916_132902.jpg not found
# 20210916_193850.jpg not found
