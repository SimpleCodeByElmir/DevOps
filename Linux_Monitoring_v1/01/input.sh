#!/bin/bash

if [[ $# != 1 || ! $1 =~ ^[a-zA-Z]+$ ]]; then
  echo "Run with one(text) parameter only."
  exit 1
else
  echo "${1}"
fi

exit 0
