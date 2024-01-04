#!/usr/bin/env bash
# simple to10 process of sys
function top_processes() {
  echo "top 10 process resource usage:"
  echo ""

  # sort by %cpu %mem
  ps -eo pid,%cpu,%mem,cmd --sort=-%cpu,%mem | head -11
}