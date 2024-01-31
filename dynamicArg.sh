#!/usr/bin/env bash
# accepts dynamic arguments and sums them together and returns the result.

function sumDynamicArguments() {
  local sum=0
  for arg in "$@"; do
    # check for int
    if [[ $arg =~ [0-9]{0,}(\.|[0-9]) ]]; then
      sum=$(echo "scale=2 ; $sum + $arg" | bc)
    else
      echo "warning: ignoring non-numeric argument: $arg"
    fi
  done

  # return the final sum
  echo "$sum"
}

sumDynamicArguments $*