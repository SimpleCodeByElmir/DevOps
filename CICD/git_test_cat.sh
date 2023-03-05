#!/bin/bash

cd src/cat/
make
bash test_cat.sh > ../../log_git.txt

PAR1=$(cat ../../log_git.txt | tail -1 | awk '{print $2}')

if [[ $PAR1 -eq 0 ]]; then
	echo "PASSED"
	rm ../../log_git.txt
	exit 0;
else
	echo "FAILED"
	rm ../../log_git.txt
	exit 1;
fi
