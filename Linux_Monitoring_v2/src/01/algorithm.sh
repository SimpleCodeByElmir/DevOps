#!/bin/bash

name=${DIRS_NAME}
date_my=$(date +%d%m%y)

###check lenght of inp str $name
function check_length {
len=${#name} 		        ### count length again
while [ $len -lt 4 ]            ### if $len <  4, add random letter from string istself, while len != 4
do
  name+=${name:$(($len-1)):1}   ### pick up random letter from $name
  len=${#name} 			### count length again
done
}

function check_memory {
  FREE_MEMORY=$(df --block-size=M / | awk 'FNR==2{print $4}')
  FREE_MEMORY=${FREE_MEMORY%M}
if [ "$FREE_MEMORY" -le 1024 ];
then
  echo "Error: space left - ${FREE_MEMORY}Mb. Needs more than 1024Mb (etc. 1Gb). Script stopped."
  rm dirs_list.txt 2>/dev/null
  exit 1
fi
}

function set_x {
if [ "$len" -eq 4 ]
then
  x=61    # (255"name max lenght" - 4) / 4 letters = ~62, and algo makes x = x + 1 => 61 + 1 = 62 each letter repeats
elif [ "$len" -eq 5 ]
then
  x=49    # (255-5)/5=50 => x+1 = 50 
elif [ "$len" -eq 6 ]
then
  x=40
elif [ "$len" -eq 7 ]
then
  x=34
fi
}

check_length
name2=$name
set_x

stopper=0
count=0
echo "Starting to create directories, please wait ..."
while (( $count < "$DIRS_NUM" ))
do
  for ((c=0; c<"$len"; c++))
  do
    name2=
    for ((r=0; r<"$len"; r++))
    do
      rndm_num=$(( $RANDOM % $x+1))
      rx=$(( $RANDOM % $len))       ### getting random number to get a lot of combinations
      if [ $rx -eq $c ]
      then
        for ((k=0; k<"$rndm_num"; k++))
        do
          name2+=${name:r:1}       ### repeating [r] letter k times
        done
      fi
      name2+=${name:r:1}           ### gathering full name
    done
    if [ ! -e "${DIR_PATH}/${name2}_${date_my}" ]
    then
      check_memory
      echo "creating directory: ${DIR_PATH}/${name2}_${date_my}"
      mkdir ${DIR_PATH}/${name2}_${date_my} 2>/dev/null
      if [ $? -eq 0 ]
      then
        (( count = $count + 1 ))
        stopper=0
        echo "Created."
        echo "${DIR_PATH}/${name2}_${date_my}" >> dirs_list.txt
        echo "[COMMAND: mkdir] --- created directory: ${DIR_PATH}/${name2}_${date_my} || DATE&TIME: $(date +%Y-%m-%d" "%R) || SIZE: $(stat -c "%s" ${DIR_PATH}/${name2}_${date_my} | awk '{print $1}') bytes" >> logs.txt
      else
        echo "Couldn't create. (Access rights=?). Trying again..."
        echo "STOPPER (till 95000) = $stopper"
      fi
      if [ "$count" -eq "$DIRS_NUM" ]   ### to prevent more then needed amount of dirs created, coz loop based on < $len
      then
        break 2
      fi
    else
      echo "directory already exists: ${DIR_PATH}/${name2}_${date_my}"
      ((stopper = $stopper + 1))
      echo "COUNT OF CREATED DIRS = $count"
      echo "STOPPER (till 95000) = $stopper"
      if [ "$stopper" -eq 95000 ]
      then
        echo "***Created $count dirs. Could not create the needed amount ($DIRS_NUM). Probably, it's because too few unique letters putted for the name. Add few different letters (not more then 7 letters allowed). (*Calculate how many unique names can be created with the given type of letters, for example, if You put just 'q' for name, then ~215 files can be created ('qqqq', 'qqqqq', etc. - until MAX length for the file name in Linux (*255 chars)). If not, then it may be another problem."
        break 2
      fi
    fi
  done
done

if [ "$count" -ne 0 ]
then
	DIRS_NUM=${count}       ### re-assign the value for DIRS_NUM=$count (in case if needed amount of dirs wasn't be created)
	echo "$count dirs created."
else
	echo "Couldn't create directories. 0 dirs was created. Maybe access issues? Try to run as Root/Sudo."
        rm dirs_list.txt 2>/dev/null
	exit 1
fi

##### FILE GENERATING ALGORITHM #####
echo "Starting to create files: ... "
name=$FILES_NAME

check_length
name2=$name
set_x

for (( i=1; i<="$DIRS_NUM"; i++ ))
do
stopper=0
count=0
patth=$(cat dirs_list.txt | head -n "$i" | tail -n 1)
echo "###Currently in $patth"
  for (( p=0; p>-1; p++ ))
  do
    for ((c=0; c<"$len"; c++))
    do
      name2=
      for ((r=0; r<"$len"; r++))
      do
        rndm_num=$(( $RANDOM % $x+1))
        rx=$(( $RANDOM % $len))       ### getting random number to get a lot of combinations
        if [ $rx -eq $c ]
        then
          for ((k=0; k<"$rndm_num"; k++))
          do
            name2+=${name:r:1}   ###repeating [r] letter k times
          done
        fi
        name2+=${name:r:1}         ###collecting common letters - full name
      done
      if [ ! -e "${patth}/${name2}_${date_my}.${EXT}" ]
      then
        check_memory
        echo "creating file: ${patth}/${name2}_${date_my}.${EXT}"
        fallocate -l $SIZE ${patth}/${name2}_${date_my}.${EXT} 2>/dev/null
        if [ $? -eq 0 ]
        then
          (( count = $count + 1 ))
          stopper=0
          echo "Created."
          echo "[COMMAND: fallocate -l] --- created file: ${patth}/${name2}_${date_my}.${EXT} || DATE&TIME: $(date +%Y-%m-%d" "%R) || SIZE: $(stat -c "%s" ${patth}/${name2}_${date_my}.${EXT} | awk '{print $1}') bytes" >> logs.txt
        else
          echo "Couldn't create. (Access rights=?). Trying again..."
          echo "STOPPER (till 95000) = $stopper"
        fi
        if [ "$count" -eq "$FILES_NUM" ]
        then
          break 2
        fi
      else
        echo "file already exists: ${patth}/${name2}_${date_my}.${EXT}"
        ((stopper = $stopper + 1))
        echo "COUNT OF CREATED FILES = $count"
        echo "STOPPER (till 95000) = $stopper"
        if [ "$stopper" -eq 95000 ]
        then
          echo "***Created $count files. Could not create the needed amount ($FILES_NUM). Probably, it's because too few unique letters putted for the name. Add few different letters (not more then 7 letters allowed). (*Calculate how many unique names can be created with the given type of letters, for example, if You put just 'q' for name, then ~215 files can be created ('qqqq', 'qqqqq', etc. - until MAX length for the file name in Linux (*255 chars)). If not, then it may be another problem."
          break 2
        fi	
      fi
    done
  done
done

files_created=${count}

echo "Done. $DIRS_NUM dirs with $files_created files in each created."
rm dirs_list.txt
