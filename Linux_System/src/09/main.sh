#!/bin/bash

CPU_USAGE=$(awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1); }' <(grep 'cpu ' /proc/stat) <(sleep 0.1;grep 'cpu ' /proc/stat))
echo "from Manhunte $CPU_USAGE"

echo "from inet CPU Usage: "$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]"%"

#top -bn2 | grep '%Cpu' | tail -1 | grep -P '(....|...) id,'|awk '{print "CPU Usage: " 100-$8 "%"}'

#cat /proc/stat | grep cpu | head -1 | awk '{print ($5*100) / ($2+$3+$4+$5+$6+$7+$8+$9+$10)}' | awk '{print "CPU Usage: " 100-$1}'
cat /proc/stat | grep cpu | head -1 | tail -1 | awk '{print ($5*100) / ($2+$3+$4+$5)}' | awk '{print "CPU Usage: " 100-$1}'
