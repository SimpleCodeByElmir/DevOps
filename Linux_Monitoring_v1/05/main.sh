#!/bin/bash

#start=$(date +%s.%1N)
startt=$(date +%s.%1N)

source input.sh

#Total number of folders
total_num=$(sudo ls -R $path | grep -c ":")
let "total_folders=total_folders-1"
echo "Total number of folders (including all nested ones) = $total_num" 

#Top 5 folders sorted from bigger to smaller
echo "Top 5 folders of maximum size arranged in descending order (path and size):"
source top-5-dirs.sh

#Total number of files
echo "Total number of files = $(sudo ls -R $path | wc -l)"
echo "Number of:"
####Find files by TYPE
conf_files=$(sudo find $path -name '*.conf' | wc -l)
text_files=$(sudo find $path -name '*.txt' | wc -l)
exe_files=$(sudo find $path -name '*.exe' | wc -l)
log_files=$(sudo find $path -name '*.log' | wc -l)
archive_files=$(sudo find $path -name '*.zip' -o -name '*.tar' -o -name '*.7z' -o -name '*.tar.gz' -o -name '*.tgz' -o -name '*.dar' -o -name '*.gzip' -o -name '*.bzip2' -o -name '*.rar' -o -name '*.war' | wc -l)
sym_links=$(sudo ls -la $path | grep "\->" | wc -l)

echo "Configuration files (with the .conf extension) = ${conf_files}"
echo "Text files = ${text_files}"
echo "Executable files = ${exe_files}"
echo "Log files (with extension .log) = ${log_files}"
echo "Archive files = ${archive_files}"
echo "Symbolic links = ${sym_links}"

###Top 10 file by size from bigger to smaller
echo "Top 10 files of maximum size arranged in descending order (pathm size and type):"
source top-10-dirs.sh

###################Top 10 executable files of the maximum size###########
echo "Top 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
source top-10-exe.sh

###Script execution time
duration="$(echo "$(date +%s.%N) - $startt" | bc)"
printf "Script execution time (in seconds) = %.2f \n" ${duration}
