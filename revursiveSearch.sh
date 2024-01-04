#!/usr/bin/env bash
# gets a filename and a path, searches a path recursively and prints any paths that the given filename is not found in that.. 


function findMissingFile() {
  if [[ $# -ne 2 ]]; then
    echo "provide the filename and the path"
    return 1
  fi

  local filename="$1"
  local searchPath="$2"
  if [ ! -d "$searchPath" ]; then
    echo "directory not found"
    return 1
  fi

  while [[ IFS= read -r -d '' dir ]]; do
    if [[ ! -e "$dir/$filename" ]]; then
      echo "$filename not found in directory: $dir"
    fi
  done < <(find "$searchPath" -type d -print0)
}