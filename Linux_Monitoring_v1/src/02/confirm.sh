#!/bin/bash

read -p "Do You want to save sys-info in a file? (Y/N): " confirm
if ! [[ ${confirm} == [yY] || ${confirm} == [yY][eE][sS] ]]; then
  exit 1
fi
