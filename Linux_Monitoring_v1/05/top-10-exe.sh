#!/bin/bash

list=$(sudo find $path -name '*.exe' -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | awk '{print $2", "$1} ') 
count=$(echo "${list}" | wc -l)
i=1
if [[ ! -z ${list} ]]; then 
  while ((i < $(($count+1))))
  do
    echo -n "${i} - "
    echo "$list" | head -$i | tail -1
    ((i = $i + 1 ))
  done
else 
  echo "No files found."
fi
