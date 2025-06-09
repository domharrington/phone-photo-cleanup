#!/usr/bin/env bash

set -e
# Uncomment for debugging
# set -x

process_files() {
  local ext="$1"
  echo "Processing *.$ext files..."

  # Collect all matching files first
  files=()
  while IFS= read -r line; do
    files+=("$line")
  done < <(find . -iname "*.$ext" -printf '%P\n')
  local total=${#files[@]}

  if [ "$total" -eq 0 ]; then
    echo "No *.$ext files found."
    return
  fi

  local count=0
  for i in "${files[@]}"; do
    ((count++))
    found=$(find ~/Pictures -name "$i")
    found_count=$(echo "$found" | grep -c .)

    if [ "$found_count" -eq 0 ]; then
      status="not found"
    else
      if [ "$DELETE" ]; then
        find . -iname "$i" -delete
        status="deleted"
      else
        status="found"
      fi
    fi

    # Show progress bar
    local bar_width=40
    local progress=$((count * bar_width / total))
    local bar=$(printf "%-${progress}s" "#" | tr ' ' '#')
    local spaces=$(printf "%-$((bar_width - progress))s" " ")
    printf "\r[%s%s] %d/%d %s" "$bar" "$spaces" "$count" "$total"

    # Optionally print detailed line
    if [ "$VERBOSE" ]; then
      printf "— %s\n" "$i $found"
    fi
  done

  # Ensure newline after final progress bar
  echo -e "\nFinished processing *.$ext files."
}

process_files "jpg"
process_files "mp4"
process_files "mov"
