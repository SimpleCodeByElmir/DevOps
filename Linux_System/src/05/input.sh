#!/bin/bash

n=$'\n'

if [[ "$#" -ne 2 ]] || ! [[ "$1" =~ ^[1-4]$ ]]
then
    echo "Invalid input. Works with 2 parameters only. It may be only a number: 1, 2, 3 or 4 and logfile, that You want to sort or search in.${n}Put number 1 - sorting by response code; 2 - searching for all unique IPs; 3 - searching for all requests with errors (response code - 4xx or 5xxx); 4 - searching for all unique IPs among the erroneous requests.${n}(example: bash main.sh 1 day1.log)"
    exit 1
else
    if [[ -e "$2" ]] && [[ -s "$2" ]] && ! [[ -d "$2" ]]
    then
        logfile=$2
    	if [ "$1" -eq 1 ]
    	then
      	 	flag=1
    	elif [ "$1" -eq 2 ]
    	then
        	flag=2
    	elif [ "$1" -eq 3 ]
    	then
        	flag=3
    	elif [ "$1" -eq 4 ]
    	then
        	flag=4
    	fi
    else
        echo "Error: the file doesn't exist or is empty, or it's a directory. Have You inputed the correct path to the file or it's name?"
        exit 1
    fi
fi
