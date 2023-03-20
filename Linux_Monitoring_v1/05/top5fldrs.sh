#!/bin/bash

tp1="$(sudo du -h --max-depth=100 $path | sort -hr | head -6 | awk 'FNR == 2 {print"1 - " $2", "$1}' )"
frs1=$(echo "$tp1")
frs2=${frs1:0:1}
if [[ "$frs2" != 1 ]]; then	
  echo "No 1th file"
else
  echo "$frs1"
fi

tp2="$(sudo du -h --max-depth=100 $path | sort -hr | head -6 | awk 'FNR == 3 {print"2 - " $2", "$1}' )"
frs3=$(echo "$tp2")
frs4=${frs3:0:1}
if [[ "$frs4" != 2 ]]; then	
  echo "No 2th file"
else
  echo "$frs3"
fi

tp3="$(sudo du -h --max-depth=100 $path | sort -hr | head -6 | awk 'FNR == 4 {print"3 - " $2", "$1}' )"
frs5=$(echo "$tp3")
frs6=${frs5:0:1}
if [[ "$frs6" != 3 ]]; then	
  echo "No 3th file"
else
  echo "$frs5"
fi

tp4="$(sudo du -h --max-depth=100 $path | sort -hr | head -6 | awk 'FNR == 5 {print"4 - " $2", "$1}' )"
frs7=$(echo "$tp4")
frs8=${frs7:0:1}
if [[ "$frs8" != 4 ]]; then	
  echo "No 4th file"
else
  echo "$frs7"
fi

tp5="$(sudo du -h --max-depth=100 $path | sort -hr | head -6 | awk 'FNR == 6 {print"5 - " $2", "$1}' )"
frs9=$(echo "$tp5")
frs10=${frs9:0:1}
if [[ "$frs10" != 5 ]]; then	
  echo "No 5th file"
else
  echo "$frs9"
fi
