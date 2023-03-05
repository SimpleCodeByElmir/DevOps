#!/bin/bash

if [ "$flag" -eq 1 ]
then
    echo "sorting ${logfile}..."
    sort -n -k 9 ${logfile}
    echo "Finished."
elif [ "$flag" -eq 2 ]
then
    echo "searching in ${logfile}" 
    awk '{printf $1"\n"}' ${logfile} | sort -u
    echo "Finished."
elif [ "$flag" -eq 3 ]
then
    echo "searching in ${logfile}" 
    num=$(wc -l < ${logfile})
    for ((k=1; k<=${num}; k++))
    do
        line=$(cat ${logfile} | head -n ${k} | tail -n 1)
        str=$(cat ${logfile} | head -n ${k} | tail -n 1 | awk 'NR=FNR{print $9}')
        if [[ "$str" -ge 400 && "$str" -le 503 ]]
        then
	    	echo "$line"
        fi
    done
    echo "Finished."
elif [ "$flag" -eq 4 ]
then
    echo "searching in ${logfile}" 
    num=$(wc -l < ${logfile})
    for ((k=1; k<=${num}; k++))
    do
        line=$(cat ${logfile} | head -n ${k} | tail -n 1)
        str=$(cat ${logfile} | head -n ${k} | tail -n 1 | awk 'NR=FNR{print $9}')
        if [[ "$str" -ge 400 && "$str" -le 503 ]]
        then
            echo "$line" >> file.log
        fi
    done
    awk '{printf $1"\n"}' file.log | sort -u
    rm file.log
    echo "Finished."
fi
