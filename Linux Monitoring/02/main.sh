#!/bin/bash
##source input.sh
source sysinfo.sh
source confirm.sh

if [[ $? -eq 0 ]]; then
	source sysinfo.sh >> $(date +"%d_%m_%Y_%H_%M_%S").status
fi
