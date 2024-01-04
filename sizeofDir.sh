#!/usr/bin/env bash
# gets a path and shows its total size in megabytes!

function totalSize() {
  if [[ $# -eq 0 ]]; then
    echo "provide a path"
    return 1
  fi

  local path="$1"

  if [[ ! -e "$path" ]]; then
    echo "path not found: $path"
    return 1
  fi
  local totalSize=$(du -hs "$path" | cut -f1)
  echo "size of $path: ${totalSize} MB"
}
