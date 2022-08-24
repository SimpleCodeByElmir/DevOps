#!/bin/bash

source check.sh

echo HOSTNAME = $(hostname)
echo TIMEZONE = $(timedatectl | grep "Time zone" | awk '{print $3" "$4" "$5}')
echo USER = $USER
echo OS = $(hostnamectl | grep "Operating System" | awk '{print $3" "$4" "$5}')
echo DATE = $(date | awk '{print $1" "$2" "$3" "$4" "$5}')
echo UPTIME = $(uptime -p)
echo UPTIME_SEC = $(awk '{print int($1)}' /proc/uptime)
echo IP = $(hostname --all-ip-addresses | awk '{print $1}')
echo MASK = $(source mask.sh)
echo GATEWAY = $(ip r | grep default | awk '{print $3}')
echo RAM_TOTAL = $(grep "MemTotal" /proc/meminfo | awk '{ printf ("%.3f GB\n", $2/1000000) }')
echo RAM_USED = $(free | grep "Mem" | awk '{ printf ("%.3f GB\n", $3/1000000) }')
echo RAM_FREE = $(free | grep "Mem" | awk '{ printf ("%.3f GB\n", $4/1000000) }')
echo SPACE_ROOT = $(df | grep "/$" | awk '{ printf ("%.2f GB\n", $2/1000000) }')
echo SPACE_ROOT_USED = $(df | grep "/$" | awk '{ printf ("%.2f GB\n", $3/1000000) }')
echo SPACE_ROOT_FREE = $(df | grep "/$" | awk '{ printf ("%.2f GB\n", $4/1000000) }')
