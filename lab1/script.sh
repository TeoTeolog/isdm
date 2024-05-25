#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Error: no option, try -a -b or -c"
    exit 1
fi

while getopts "abc" opt; do
  case ${opt} in
    a )
      /usr/bin/python3 --version
      ;;
    b )
      grep 'PRETTY_NAME' /etc/os-release | cut -d= -f2
      ;;
    c )
      /usr/bin/python3 -c "import this"
      ;;
    \? )
      exit 1
      ;;
  esac
done
