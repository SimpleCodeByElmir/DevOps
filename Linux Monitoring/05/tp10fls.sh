#!/bin/bash

###Top 10 file by size from bigger to smalles
q1="$(sudo find $path -type f -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | awk 'FNR == 1 {print"1 - " $2", "$1}' )"
qr1=$(echo "$q1")
qr2=${qr1:0:1}
if [[ "$qr2" != 1 ]]; then	
	echo "No 1th file"
else
	echo "$qr1"
fi

q2="$(sudo find $path -type f -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | awk 'FNR == 2 {print"2 - " $2", "$1}' )"
qr3=$(echo "$q2")
qr4=${qr3:0:1}
if [[ "$qr4" != 2 ]]; then	
	echo "No 2th file"
else
	echo "$qr3"
fi

q3="$(sudo find $path -type f -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | awk 'FNR == 3 {print"3 - " $2", "$1}' )"
qr5=$(echo "$q3")
qr6=${qr5:0:1}
if [[ "$qr6" != 3 ]]; then	
	echo "No 3th file"
else
	echo "$qr5"
fi

q4="$(sudo find $path -type f -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | awk 'FNR == 4 {print"4 - " $2", "$1}' )"
qr7=$(echo "$q4")
qr8=${qr7:0:1}
if [[ "$qr8" != 4 ]]; then	
	echo "No 4th file"
else
	echo "$qr7"
fi

q5="$(sudo find $path -type f -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | awk 'FNR == 5 {print"5 - " $2", "$1}' )"
qr9=$(echo "$q5")
qr10=${qr9:0:1}
if [[ "$qr10" != 5 ]]; then	
	echo "No 5th file"
else
	echo "$qr9"
fi

q6="$(sudo find $path -type f -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | awk 'FNR == 6 {print"6 - " $2", "$1}' )"
qr11=$(echo "$q6")
qr12=${qr11:0:1}
if [[ "$qr12" != 6 ]]; then	
	echo "No 6th file"
else
	echo "$qr11"
fi

q7="$(sudo find $path -type f -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | awk 'FNR == 7 {print"7 - " $2", "$1}' )"
qr13=$(echo "$q7")
qr14=${qr13:0:1}
if [[ "$qr14" != 7 ]]; then	
	echo "No 7th file"
else
	echo "$qr13"
fi

q8="$(sudo find $path -type f -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | awk 'FNR == 8 {print"8 - " $2", "$1}' )"
qr15=$(echo "$q8")
qr16=${qr15:0:1}
if [[ "$qr16" != 8 ]]; then	
	echo "No 8th file"
else
	echo "$qr15"
fi

q9="$(sudo find $path -type f -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | awk 'FNR == 9 {print"9 - " $2", "$1}' )"
qr17=$(echo "$q9")
qr18=${qr17:0:1}
if [[ "$qr18" != 9 ]]; then	
	echo "No 9th file"
else
	echo "$qr17"
fi

q10="$(sudo find $path -type f -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | awk 'FNR == 10 {print"10 - " $2", "$1}' )"
qr19=$(echo "$q10")
qr20=${qr19:0:1}
if [[ "$qr20" != 10 ]]; then	
	echo "No 10th file"
else
	echo "$qr19"
fi
