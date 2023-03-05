#!/bin/bash

if ! [[ $1 ]]; then
	echo "Run this script with one text parameter!"
	exit
fi

par=$1

if [[ $2 ]]; then
	echo "Only 1 parameter allowed!"
	exit
fi

if ! [[ $par =~ ^[a-zA-Z]+$ ]]; then
	echo "Invalid input. Only letters allowed."
else
	echo $par
fi
