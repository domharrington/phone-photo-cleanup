#!/usr/bin/env bash

set -e
# Add this to see all of the commands being run
# set -x

{
  find . -iname "*.jpg" -printf '%P\n' | while IFS= read i
  do
    found=$(find ~/Pictures -name "$i")
    count=$(echo $found | wc -l)
    if [ $count -eq 0 ]; then
      echo "$i not found"
    else
      if [ $DELETE ]; then
        echo "$i found, deleting"
        find . -iname "$i" -delete
      elif [ $VERBOSE ]; then
        echo "$i found $found"
      fi
    fi
  done
}

{
  find . -iname "*.mp4" -printf '%P\n' | while IFS= read i
  do
    found=$(find ~/Pictures -name "$i")
    count=$(echo $found | wc -l)
    if [ $count -eq 0 ]; then
      echo "$i not found"
    else
      if [ $DELETE ]; then
        echo "$i found, deleting"
        find . -iname "$i" -delete
      elif [ $VERBOSE ]; then
        echo "$i found $found"
      fi
    fi
  done
}

{
  find . -iname "*.mov" -printf '%P\n' | while IFS= read i
  do
    found=$(find ~/Pictures -name "$i")
    count=$(echo $found | wc -l)
    if [ $count -eq 0 ]; then
      echo "$i not found"
    else
      if [ $DELETE ]; then
        echo "$i found, deleting"
        find . -iname "$i" -delete
      elif [ $VERBOSE ]; then
        echo "$i found $found"
      fi
    fi
  done
}
