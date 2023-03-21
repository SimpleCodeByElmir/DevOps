#!/bin/bash

if [[ ! -e "$1" || $# != 1 ]]; then
  echo "Path doesn't exist | Put one parameter only."
  exit 1
else
  path=$1
fi
