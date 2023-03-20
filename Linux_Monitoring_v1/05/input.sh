#!/bin/bash

if [[ "$path" != */ ]]; then
  echo "Incorrect path."
  exit 1
fi
