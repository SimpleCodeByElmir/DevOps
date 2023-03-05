#!/bin/bash

set -e

ssh elmir@192.168.43.150 "mkdir /home/elmir/artifacts/ && exit"
scp src/cat/s21_cat src/grep/s21_grep elmir@192.168.43.150:/home/elmir/artifacts/
ssh elmir@192.168.43.150 "mv artifacts/ /usr/local/bin/ && exit"
#if scp src/cat/s21_cat src/grep/s21_grep elmir@192.168.43.150:/home/elmir/artifacts/
#then	
#	ssh elmir@192.168.43.150 "mv artifacts/ /usr/local/bin/ && exit"
#	exit 0;
#else
#	exit 1;
#fi
