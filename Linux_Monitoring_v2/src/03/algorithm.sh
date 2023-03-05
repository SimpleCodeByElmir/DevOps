#/bin/bash

if [ "$flag" -eq 1 ]
then
    echo "Starting to remove files from the $logfile: ..."
    DIRS_NUM=$(grep -c "mkdir" $logfile)
    echo "$DIRS_NUM dirs found."
    for ((i=1; i<="$DIRS_NUM"; i++))
    do
        patth=$(cat ${logfile} | head -n ${i} | tail -n 1 | awk '{print $6}')
        echo "Removing a directory..."
        rm -rf ${patth}
    done
    echo "Done."
elif [ "$flag" -eq 2 ]
then
    echo "Working..."
    find / -type d -newermt "$range_bgng" \! -newermt "$range_endng" -regex ".+/[a-z]+_[0-9]+$" 2>/dev/null | xargs rm -rf
    echo "Done."
elif [ "$flag" -eq 3 ]
then
    echo "Working..."
    find / -type d -regex ".+/[${name}]+_${datte}$" 2>/dev/null | xargs rm -rf
    echo "Done."
fi
