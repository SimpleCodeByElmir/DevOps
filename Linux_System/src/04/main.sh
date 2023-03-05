#!/bin/bash

if [[ "$#" -ne 0 ]]
then
    echo "Run without parameters. This script don't take any parameters (run 'bash main.sh')."
    exit 1
else
    for ((i=1; i<=5; i++))
    do
        echo "Generating day$i.log, please wait ..."
        rndm=$(($RANDOM%900+100))
        for ((p=0; p<$rndm; p++))
        do
            ip=$(($RANDOM%254+1)).$(($RANDOM%254+1)).$(($RANDOM%254+1)).$(($RANDOM%254+1))
            date_time=$(date -d "2023-1-$i $((RANDOM%23+1)):$((RANDOM%59+1)):$((RANDOM%59+1))" '+[%d/%b/%Y:%H:%M:%S %z]') # date&time
            method=$(shuf -n1 ./common/methods.txt)
            protocol=$(shuf -n1 ./common/protocols.txt)
            url=$(shuf -n1 ./common/urls.txt)
            code=$(shuf -n1 ./common/codes.txt)
            bytes=$(($RANDOM%120000+1))
            agent=$(shuf -n1 ./common/agents.txt)
            echo "$ip - - $date_time \"$method $url $protocol\" $code $bytes \"-\" \"$agent\"" >> dday$i.log
        done
	sort -t":" -k2n -k3n -k4n dday$i.log > day$i.log
	rm dday$i.log
    done
fi
exit 0


#"2xx" - Successful responses HTTP
#200 - OK
#201 - Created
#
#"4xx" - Client error responses
#400 - Bad Request
#401 - Unauthorized
#403 - Forbidden
#404 - Not Found
#
#"5xx" - Server error responses
#500 - Internal Server Error
#501 - Not Implemented
#502 - Bad Gateway
#503 - Service Unavailable
