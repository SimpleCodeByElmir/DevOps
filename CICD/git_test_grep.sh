#!/bin/bash

cd src/grep/
make
bash test_grep.sh > ../../log2_git.txt

PAR2=$(cat ../../log2_git.txt | tail -1 | awk '{print $2}')

if [[ $PAR2 -eq 0 ]]; then
	echo "PASSED"
	rm ../../log2_git.txt
	exit 0;
else
	echo "FAILED"
	rm ../../log2_git.txt
	exit 1;
fi
