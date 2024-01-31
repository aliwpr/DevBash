#!/usr/bin/env bash

function printSystemInfo() {
  echo "sys info:"
  echo ""

  
  echo "hardware:"
  echo ""
  lshw -short

  echo ""
  echo "user info:"
  echo "-----------------"
  echo "username: $(whoami)"
  echo "user ID: $(id -u)"
  echo "users groups: $(id -Gn)"

  echo ""
  echo "sys info:"
  echo ""
  echo "hostname: $(hostname)"
  echo "OS: $(uname -s -r -m)"
  if command -v lsb_release &>/dev/null ; then
    echo "distriu: $(lsb_release -d | cut -f2)"
  elif [ -f /etc/os-release ]; then
    echo "distriu: $(grep -i "pretty" /etc/os-release | cut -d"=" -f2)"
  fi

}
printSystemInfo