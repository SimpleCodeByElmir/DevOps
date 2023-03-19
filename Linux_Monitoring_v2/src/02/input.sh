#!/bin/bash

n=$'\n'

if [[ "$#" -ne 3 ]]; then
  echo "Invalid count of parameters. Works with 3 only.${n}Example: azdx azdx.aza 10Mb ===> dirname_letters (no more then 7), filesname_letters.extension (no more then 7 before dot and no more then 3 after dot), size_of_file (only 'Mb')."
  exit 1
fi

if ! [[ "$1" =~ ^[a-z]{1,7}$ ]]; then
  echo "Invalid first parameter. Only letters allowed (from 1 to 7 letters)."
  exit 1
else
  DIRS_NAME=$1
  if [ ${#DIRS_NAME} -eq 1 ]; then
    echo "Notice: first parameter = only one letter. So, ~215 dirs will be created with this one letter. Add more different letters to make it possible to generate much more files and faster."
  fi
fi

if ! [[ "$2" =~ ^([a-z]{1,7})\.([a-z]{1,3})$ ]]; then
  echo "Invalid second parameter. Only letters allowed (in format: qwertyu.azx (1-7 letters before dot and 1-3 letters after dot)."
  exit 1
else
  FILES_NAME=${2%.*}
  EXT=${2#*.}
  if [ ${#FILES_NAME} -eq 1 ]; then
    echo "Notice: second parameter - only one letter inputed. So, ~215 files in each dir will be created with this one letter. Add more different letters to make it possible to generate much more files faster."
  fi
fi

if [[ "$3" =~ (^[0-9]+)Mb$ ]]; then
  SIZE=${3%Mb} #deleting "Mb" from string for to get integer
  if [ "$SIZE" -gt 100 ] || [ "$SIZE" -eq 0 ]; then
    echo "Invalid third parameter: 100Mb or less allowed (but not ZERO)."
    exit 1
  fi
  SIZE=$3
elif [[ "$3" =~ ^([0-9]+)\.([0-9]+)Mb$ ]]; then
  SIZE=${3%.*}
  FLOAT=${3#*.} && FLOAT=${FLOAT%Mb}
  if [ "$SIZE" -gt 100 ]; then
    echo "Invalid third parameter: 100Mb or less allowed (but not ZERO)."
    exit 1
  elif [ "$SIZE" -eq 100 ] && [ "$FLOAT" -gt 0 ]; then
    echo "Invalid third parameter: 100Mb or less allowed (but not ZERO). *Number can't be bigger 100.00"
    exit 1
  elif [ "$SIZE" -eq 0 ] && [ "$FLOAT" -eq 0 ]; then
    echo "Invalid third parameter: 0.0 === Zeroes? Are You serious? Common, put a 'real' number except 'only zeroes'."
    exit 1
  fi
  SIZE=$3
else
  echo "Invalid third parameter.Only 'number.Mb' format allowed (etc. '10Mb', '0.1Mb'. *in range 0.x1 - 100.00 'Mb')"
  exit 1
fi

############# - VARIABLES - ###########
#DIRS_NAME=$1
#FILES_NAME=$2 till dot
#$EXT = $2 after dot
#SIZE=$3
#echo "$DIRS_NAME, $FILES_NAME, $EXT, $SIZE"
