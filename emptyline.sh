#!/usr/bin/env bash
# create a function that gets a file and prints all uncommented lines.

function emptyLines {
    if [[ $# -eq 0 ]]; then
        echo "please provide a filename"
        return 1
    fi

local filename=$1

    if [[ ! -f "$filename" ]]; then
        echo "file not found"
        return 1
    fi
    
    while [[ IFS= read -r line ]]; do
    # -n for check not an empty line
        if [[ -n "$line" && "$line" != "#"* ]]; then
            echo "$line"
        fi
    # inja ham filename ro goftim az input nagir wa filename ro begir.
    done < "$filename"

}

emptyLines $1