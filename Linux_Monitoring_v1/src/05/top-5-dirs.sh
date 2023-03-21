#!/bin/bash

list=$(sudo du -h --max-depth=100 $path | sort -hr | head -6 | awk '{ print $2 ", " $1 } ') 
count=$(echo "${list}" | wc -l)
i=2
if [[ ${count} > 1 ]]; then
  while ((i < $(($count+1))))
  do
    echo -n "$(($i-1)) - "
    echo "$list" | head -$i | tail -1
    ((i = $i + 1 ))
  done
else 
  echo "No dirs found."
fi
