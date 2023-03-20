#!/bin/bash

start=$(date +%s.%1N)

if [[ $# != 1 ]]; then
  echo "Input only 1 parameter(the path)."
  exit 1
fi

path=$1
source input.sh

#Total number of folders
par1=$(sudo ls -R $path | grep -c ":")
let "par2=par1-1"
echo "Total number of folders (including all nested ones) = $par2" 

#Top 5 folders sorted from bigger to smaller
echo "Top 5 folders of maximum size arranged in descending order (path and size):"
source top5fldrs.sh

#Total number of files
echo "Total number of files = $(sudo ls -R $path | wc -l)"
echo "Number of:"
####Find files by TYPE
findo1=$(sudo find $path -name '*.conf' | wc -l)
findo2=$(sudo find $path -name '*.txt' | wc -l)
findo3=$(sudo find $path -name '*.exe' | wc -l)
findo4=$(sudo find $path -name '*.log' | wc -l)
findo5=$(sudo find $path -name '*.zip' -o -name '*.tar' -o -name '*.7z' -o -name '*.tar.gz' -o -name '*.tgz' -o -name '*.dar' -o -name '*.gzip' -o -name '*.bzip2' -o -name '*.rar' -o -name '*.war' | wc -l)
findo6=$(sudo ls -la $path | grep "\->" | wc -l)

echo "Configuration files (with the .conf extension) = "$findo1""
echo "Text files = "$findo2""
echo "Executable files = "$findo3""
echo "Log files (with extension .log) = "$findo4""
echo "Archive files = "$findo5""
echo "Symbolic links = "$findo6""

###Top 10 file by size from bigger to smalles
echo "Top 10 files of maximum size arranged in descending order (pathm size and type):"
source tp10fls.sh

###################Top 10 executable files of the maximum size###########
echo "Top 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
source toptenex.sh

###Time of the script speedeness
duration=$(echo "$(date +%s.%1N) - $start" | bc)
echo "Script execution time (in seconds) = $duration"
