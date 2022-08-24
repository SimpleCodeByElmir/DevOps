#!/bin/bash


#1
md1="$(sudo find $path -name '*.exe' -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | awk 'FNR == 1 {print"1 - " $2", "$1} ')"
md2="$(sudo find $path -name '*.exe' -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | tail -9 | md5sum | awk '{print $1}')"
frstchr1=$(echo "$md1, $md2")
frstchr2=${frstchr1:0:1}
if [[ "$frstchr2" != 1 ]]; then	
	echo "No 1th file"
else
	echo "$frstchr1"
fi

#2
md3="$(sudo find $path -name '*.exe' -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | awk 'FNR == 2 {print"2 - " $2", "$1} ')"
md4="$(sudo find $path -name '*.exe' -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | tail -8 | md5sum | awk '{print $1}')"
frstchr3=$(echo "$md3, $md4")
frstchr4=${frstchr3:0:1}
if [[ "$frstchr4" != 2 ]]; then	
	echo "No 2th file"
else
	echo "$frstchr3"
fi


#3
md5="$(sudo find $path -name '*.exe' -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | awk 'FNR == 3 {print"3 - " $2", "$1} ')"
md6="$(sudo find $path -name '*.exe' -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | tail -7 | md5sum | awk '{print $1}')"
frstchr5=$(echo "$md5, $md6")
frstchr6=${frstchr5:0:1}
if [[ "$frstchr6" != 3 ]]; then	
	echo "No 3th file"
else
	echo "$frstchr5"
fi


#4
md7="$(sudo find $path -name '*.exe' -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | awk 'FNR == 4 {print"4 - " $2", "$1} ')"
md8="$(sudo find $path -name '*.exe' -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | tail -6 | md5sum | awk '{print $1}')"
frstchr7=$(echo "$md7, $md8")
frstchr8=${frstchr7:0:1}
if [[ "$frstchr8" != 4 ]]; then	
	echo "No 4th file"
else
	echo "$frstchr7"
fi


#5
md9="$(sudo find $path -name '*.exe' -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | awk 'FNR == 5 {print"5 - " $2", "$1} ')"
md10="$(sudo find $path -name '*.exe' -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | tail -5 | md5sum | awk '{print $1}')"
frstchr9=$(echo "$md9, $md10")
frstchr10=${frstchr9:0:1}
if [[ "$frstchr10" != 5 ]]; then	
	echo "No 5th file"
else
	echo "$frstchr9"
fi


#6
md11="$(sudo find $path -name '*.exe' -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | awk 'FNR == 6 {print"6 - " $2", "$1} ')"
md12="$(sudo find $path -name '*.exe' -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | tail -4 | md5sum | awk '{print $1}')"
frstchr11=$(echo "$md11, $md12")
frstchr12=${frstchr11:0:1}
if [[ "$frstchr12" != 6 ]]; then	
	echo "No 6th file"
else
	echo "$frstchr11"
fi


#7
md13="$(sudo find $path -name '*.exe' -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | awk 'FNR == 7 {print"7 - " $2", "$1} ')"
md14="$(sudo find $path -name '*.exe' -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | tail -3 | md5sum | awk '{print $1}')"
frstchr13=$(echo "$md13, $md14")
frstchr14=${frstchr13:0:1}
if [[ "$frstchr14" != 7 ]]; then	
	echo "No 7th file"
else
	echo "$frstchr14"
fi

#8
md15="$(sudo find $path -name '*.exe' -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | awk 'FNR == 8 {print"8 - " $2", "$1} ')"
md16="$(sudo find $path -name '*.exe' -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | tail -2 | md5sum | awk '{print $1}')"
frstchr15=$(echo "$md15, $md16")
frstchr16=${frstchr15:0:1}
if [[ "$frstchr16" != 8 ]]; then	
	echo "No 8th file"
else
	echo "$frstchr15"
fi


#9
md17="$(sudo find $path -name '*.exe' -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | awk 'FNR == 9 {print"9 - " $2", "$1} ')"
md18="$(sudo find $path -name '*.exe' -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | tail -1 | md5sum | awk '{print $1}')"
frstchr17=$(echo "$md17, $md18")
frstchr18=${frstchr17:0:1}
if [[ "$frstchr18" != 9 ]]; then	
	echo "No 9th file"
else
	echo "$frstchr17"
fi

#10
md19="$(sudo find $path -name '*.exe' -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | awk 'FNR == 10 {print"10 - " $2", "$1} ')"
md20="$(sudo find $path -name '*.exe' -exec du -a -h --max-depth=100 {} + | sort -hr | head -10 | tail -0 | md5sum | awk '{print $1}')"
frstchr19=$(echo "$md1, $md2")
frstchr20=${frstchr19:0:1}
if [[ "$frstchr20" != 10 ]]; then	
	echo "No 10th file"
else
	echo "$frstchr19"
fi
