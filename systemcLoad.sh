#!/usr/bin/env bash

# warn if load_average above 80%
function checkLoad {
  local cpuCount=$(nproc)

  local load=$(uptime | awk '{print $10}' | cut -d "," -f1)

  local threshold=$(awk "BEGIN {print $cpu_count * 0.8}")

  echo "sys load:"
  echo "num of CPUs: $cpuCount"
  echo "current load: $load"
  # for example 12 > 15 | bc -l return 0 but 13 > 11 return 1
  if (( $(echo "$load > $threshold" | bc -l) )); then
    echo "consider checking the resource usage."
  else
    echo "system load is within limits."
  fi
}