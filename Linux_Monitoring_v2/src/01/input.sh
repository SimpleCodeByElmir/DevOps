#!/bin/bash

n=$'\n'

if [[ "$#" -ne 6 ]]; then
  echo "Invalid count of parameters. Works with 6 only.${n}Example: /home/user 50 azdx 100 azdx.aza 10kb ===> path, dirs_number, dirname_letters (no more then 7), files_number, filesname_letters.extension (no more then 7 before dot and no more then 3 after dot), size_of_file (only 'kb')."
  exit 1
fi

if ! [[ ${1:0:1} == '/' ]]; then
  echo "Invalid first parameter. Absolute path must start with '/' (from root directory to target directory). "
  exit 1
else
  DIR_PATH=$1
  if ! [[ -d "$DIR_PATH" ]]
  then
    echo "$DIR_PATH doesn't exist."
    fi
fi

if ! [[ "$2" =~ ^[0-9]+$ ]]; then
  echo "Invalid second parameter. Only numbers."
  exit 1
else
  DIRS_NUM=$2
  if [[ "$DIRS_NUM" =~ ^(0)[0-9]+$ ]] || [[ "$DIRS_NUM" -eq 0 ]]; then
  echo "Second parameter can't be ZERO or start from ZERO (etc. '0', '01')."
  exit 1
  fi
fi

if ! [[ "$3" =~ ^[a-z]{1,7}$ ]]; then
  echo "Invalid third parameter. Only letters allowed (from 1 to 7 letters)."
  exit 1
else
  DIRS_NAME=$3
  if [ ${#DIRS_NAME} -eq 1 ]; then
    echo "Notice: third parameter - only one letter inputed. So, ~215 dirs will be created with this one letter. Add more different letters to make it possible to generate much more files and faster."
  fi
fi

if ! [[ "$4" =~ ^[0-9]+$ ]]; then
  echo "Invalid fourth parameter. Only numbers allowed."
  exit 1
else
  FILES_NUM=$4
  if [[ "$FILES_NUM" =~ ^(0)[0-9]+$ ]] || [[ "$FILES_NUM" -eq 0 ]]; then
  echo "Fourth parameter can't be ZERO or start from ZERO (etc. '0', '01')."
  exit 1
  fi
fi

if ! [[ "$5" =~ ^([a-z]{1,7})\.([a-z]{1,3})$ ]]; then
  echo "Invalid fifth parameter. Only letters allowed (in format: qwertyu.azx (1-7 letters before dot and 1-3 letters after dot)."
  exit 1
else
  FILES_NAME=${5%.*}
  EXT=${5#*.}
  if [ ${#FILES_NAME} -eq 1 ]
  then
    echo "Notice: fifth parameter - only one letter inputed. So, ~215 files in each dir will be created with this one letter. Add more different letters to make it possible to generate much more files faster."
  fi
fi

if [[ "$6" =~ (^[0-9]+)kb$ ]]; then
  SIZE=${6%kb} #deleting "kb" from string for to get integer
  if [ "$SIZE" -gt 100 ] || [ "$SIZE" -eq 0 ]; then
    echo "Invalid sixth parameter: 100kb or less allowed (but not ZERO)."
    exit 1
  fi
  SIZE=$6
elif [[ "$6" =~ ^([0-9]+)\.([0-9]+)kb$ ]]; then
  SIZE=${6%.*}
  FLOAT=${6#*.} && FLOAT=${FLOAT%kb}
  if [ "$SIZE" -gt 100 ]; then
    echo "Invalid sixth parameter: 100kb or less allowed (but not ZERO)."
    exit 1
  elif [ "$SIZE" -eq 100 ] && [ "$FLOAT" -gt 0 ]; then
    echo "Invalid sixth parameter: 100kb or less allowed (but not ZERO). *Number can't be bigger 100.00"
    exit 1
  elif [ "$SIZE" -eq 0 ] && [ "$FLOAT" -eq 0 ]; then
    echo "Invalid sixth parameter: 0.0 === Zeroes? Are You serious? Common, put a 'real' number except 'only zeroes'."
    exit 1
  fi
  SIZE=$6
else
  echo "Invalid sixth parameter.Only 'number.kb' format allowed (etc. '10kb', '0.1kb'. *in range 0.x1 - 100.00 'kb')"
  exit 1
fi

############# - VARIABLES - ###########
#DIR_PATH=$1
#DIRS_NUM=$2
#DIRS_NAME=$3
#FILES_NUM=$4
#FILES_NAME=$5 till dot
#$EXT = $5 after dot
#SIZE=$6
#echo "$DIR_PATH, $DIRS_NUM, $DIRS_NAME, $FILES_NUM, $FILES_NAME, $EXT, $SIZE"
