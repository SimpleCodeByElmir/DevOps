#!/bin/bash

n=$'\n'

if [[ "$#" -ne 2 ]] || ! [[ "$1" =~ ^[1-3]$ ]]; then
  echo "Invalid input. Put number 1 and logfile - to delete files by the logfile; number 2 and startingdate_time=endingdate_time - to delete files in needed date and time range; number 3 and namemask_date - to delete files by the name_date.${n}(examples: bash main.sh 1 logfile.log; bash main.sh 2 '23-01-17 20:00=23-01-17 20:01'; bash main.sh 3 qwer_160123)."
  exit 1
else
  if [[ "$1" -eq 1 ]]; then
    if [[ -e $2 ]] && [[ -s $2 ]] && ! [[ -d $2 ]]; then
      logfile=$2
      flag=1
    else
      echo "Error: the file doesn't exist or is empty, or it's a directory. Have You inputed the correct path to the file or it's name?"
      exit 1
    fi
  elif [[ "$1" -eq 2 ]]; then
    if [[ "$2" =~ ^[0-9]{2}-[0-9]{2}-[0-9]{2}\ [0-9]{2}:[0-9]{2}=[0-9]{2}-[0-9]{2}-[0-9]{2}\ [0-9]{2}:[0-9]{2}$ ]]
    then
      range_bgng=${2%=*}
      range_endng=${2#*=}
      flag=2
    else
      echo "Incorrect format for time range (must be: '%y-%m-%d %H:%M=%y-%m-%d %H:%M' (etc. '23-01-17 20:00=23-01-17 20:01'))."
      exit 1
    fi
  elif [[ "$1" -eq 3 ]]; then
    if [[ "$2" =~ ^[a-z]{1,7}_[0-9]{6}$ ]]; then
      name=${2%_*}
      datte=${2#*_}
      flag=3
    else
      echo "Incorrect format. (must be: 'q_160123' or 'asdx_170123' and simmilar. Notice: from 1 to 7 letters for name-mask and exactly 6 digits for the date)."
      exit 1
    fi
  fi
fi
