#!/bin/bash

read -p "Do You want ro write data in a file? (Y/N): " confirm && 
	[[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
