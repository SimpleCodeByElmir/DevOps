#!/bin/bash

### IF YOU WANT TO CREATE FILES IN PATHS WITH 'HIGH ACCESS RIGHTS (etc. ROOT)', THEN RUN THIS SCRIPT AS ROOT / SUDOER.

startt=$(date +%s.%N)
started_at=$(date +%T)

source input.sh
chmod +x algorithm.sh
source algorithm.sh

duration=$(echo "$(date +%s.%N) - $startt" | bc)
execution_time=$(printf "%.2f seconds" $duration)

echo -e "\n" >> logs.txt
echo "TIME INFO:" >> logs.txt && echo "TIME INFO:"
echo "Script Started at: $started_at" >> logs.txt && echo "Script Started at: $started_at"
echo "Script Ended at: $(date +%T)" >> logs.txt && echo "Script Ended at: $(date +%T)"
echo "Script Execution Time: $execution_time" >> logs.txt && echo "Script Execution Time: $execution_time"
exit 0
