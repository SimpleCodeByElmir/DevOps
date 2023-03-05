#!/bin/bash

if [[ "$#" -ne 0 ]]
then
    echo "Run without parameters. This script don't take any parameters (run 'bash main.sh')."
    exit 1
else
    goaccess ./logs/day*.log -o report.html --log-format=COMBINED
fi
