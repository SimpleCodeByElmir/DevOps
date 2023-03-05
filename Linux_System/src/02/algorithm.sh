#!/bin/bash

name=${DIRS_NAME}
date_my=$(date +%d%m%y)

###check lenght of inp str $name
function check_length {
len=${#name} 					### count length again
while [ $len -lt 5 ]         ### if $len < 5 add the last letter from string, while len != 5
do
		name+=${name:$(($len-1)):1}   ### pick up random letter from $name
		len=${#name} 					### count length again
done
}

function check_memory {
FREE_MEMORY=$(df -h / -BM |  awk 'FNR==2{print $4}')
FREE_MEMORY=${FREE_MEMORY%M} #we need only int, without "M" letter
if [ "$FREE_MEMORY" -le 1024 ]
then
    echo "Space left: ${FREE_MEMORY}Mb. Needs more than 1024Mb (etc. 1Gb). Script stopped."
    rm all_dirs.txt 2>/dev/null
    rm dirs_list.txt 2>/dev/null
    exit 1
fi
}

function set_x {
if [ "$len" -eq 5 ]
then
	x=49    # (255-5)/5=50 => x+1 = 50. 
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

echo "Creating list of directories. Please, wait..."
find /home -type d -not -regex ".*/bin\|.*/sbin" 2>/dev/null > all_dirs.txt
sed -i '1d' all_dirs.txt ###deleting first line which is "/" - for to not garbage this place
if ! [ -s all_dirs.txt ]
then
	echo "Could not create. Check 'find' command in this script... Access rights? Try to run as Root/Sudo (be carefull)."
	rm all_dirs.txt 2>/dev/null
	exit 1
fi

DIRS_NUM=$(($RANDOM%70+31))
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
				name2+=${name:r:1}   ###repeating [r] letter k times
			done
		fi
		name2+=${name:r:1}         ### gathering full name
		done
		DIR_PATH=$(shuf -n 1 all_dirs.txt)
			if [ ! -e "${DIR_PATH}/${name2}_${date_my}" ]
			then
				check_memory
				echo "creating directory: ${DIR_PATH}/${name2}_${date_my}"
				mkdir ${DIR_PATH}/${name2}_${date_my} 2>/dev/null
				if [ $? -eq 0 ]; then
				(( count = $count + 1 ))
				stopper=0
				echo "Created."
				echo "${DIR_PATH}/${name2}_${date_my}" >> dirs_list.txt
				echo "[COMMAND: mkdir] --- created directory: ${DIR_PATH}/${name2}_${date_my} || DATE&TIME: $(date +%Y-%m-%d" "%R) || SIZE: $(stat -c "%s" ${DIR_PATH}/${name2}_${date_my} | awk '{print $1}') bytes" >> logs.txt
				else
					echo "Couldn't create. (Access rights=?). Trying again..."
					echo "STOPPER (till 50000) = $stopper"
				fi
				if [ "$count" -eq "$DIRS_NUM" ]
				then
					break 2
				fi
			else
				echo "directory already exists: ${DIR_PATH}/${name2}_${date_my}"
				((stopper = $stopper + 1))
				echo "COUNT OF CREATED DIRS = $count"
				echo "STOPPER (till 50000) = $stopper"
				if [ "$stopper" -eq 50000 ]
				then
					echo "***An error occured. Program stopped creating directories. Created only $count dirs."
					break 2
				fi
			fi
	done
done
if [ "$count" -ne 0 ]
then
	DIRS_NUM=${count}
	echo "$DIRS_NUM dirs created."
else
	echo "Couldn't create directories. 0 dirs was created. Maybe access rights issue? Try to run as Root/Sudo."
	rm all_dirs.txt 2>/dev/null
	rm dirs_list.txt 2>/dev/null
	exit 1
fi

##### FILE GENERATING ALGORITHM #####
echo "Starting to create files: ... "
name=$FILES_NAME

check_length
name2=$name
set_x

motor=-1
for (( i=1; i<="$DIRS_NUM"; i++ ))
do
stopper=0
count=0
patth=$(cat dirs_list.txt | head -n "$i" | tail -n 1)
FILES_NUM=$(($RANDOM % 70 + 31))
echo "###Currently in $patth"
for (( p=0; p>"$motor"; p++ ))
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
			if [ $? -eq 0 ]; then
			(( count = $count + 1 ))
			stopper=0
			echo "Created."
			echo "[COMMAND: fallocate] --- created file: ${patth}/${name2}_${date_my}.${EXT} || DATE&TIME: $(date +%Y-%m-%d" "%R) || SIZE: $(stat -c "%s" ${patth}/${name2}_${date_my}.${EXT} | awk '{print $1}') bytes" >> logs.txt
			else
				echo "Couldn't create. (Access rights=?). Trying again..."
				echo "STOPPER (till 50000) = $stopper"
			fi
			if [ "$count" -eq "$FILES_NUM" ]
			then
					break 2
			fi
		else
			echo "file already exists: ${patth}/${name2}_${date_my}.${EXT}"
			((stopper = $stopper + 1))
			echo "COUNT OF CREATED FILES = $count"
			echo "STOPPER (till 50000) = $stopper"
			if [ "$stopper" -eq 50000 ]
			then
					echo "***An error occured. Program stopped creating directories. Created only $count dirs."
					break 2
			fi
		fi
	done
done
done

echo "Done. $DIRS_NUM dirs with random amount of files in each created."
rm dirs_list.txt
rm all_dirs.txt
