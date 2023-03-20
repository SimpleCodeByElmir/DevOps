#!/bin/bash

source sysinfo.sh >> 1.status

source checksettings.sh

par1=$column1_background
par2=$column1_font_color
par3=$column2_background
par4=$column2_font_color

if [[ $par1 != $par2 && $par3 != $par4 ]]; then
  ENDCOL='\033[0m'
  if [[ $par1 -eq 1 ]]; then
    COLB='\033[1;47m'
  elif [[ $par1 -eq 2 ]]; then
    COLB='\033[1;41m'	
  elif [[ $par1 -eq 3 ]]; then
    COLB='\033[1;42m'	
  elif [[ $par1 -eq 4 ]]; then
    COLB='\033[1;44m'	
  elif [[ $par1 -eq 5 ]]; then
    COLB='\033[1;45m'	
  elif [[ $par1 -eq 6 ]]; then
    COLB='\033[1;40m'	
  fi

  if [[ $par2 -eq 1 ]]; then
    COL='\033[1;37m'
  elif [[ $par2 -eq 2 ]]; then
    COL='\033[1;31m'
  elif [[ $par2 -eq 3 ]]; then
    COL='\033[1;32m'
  elif [[ $par2 -eq 4 ]]; then
    COL='\033[1;34m'
  elif [[ $par2 -eq 5 ]]; then
    COL='\033[1;35m'
  elif [[ $par2 -eq 6 ]]; then
    COL='\033[1;30m'
  fi

  if [[ $par3 -eq 1 ]]; then
    SCOLB='\033[1;47m'
  elif [[ $par3 -eq 2 ]]; then
    SCOLB='\033[1;41m'	
  elif [[ $par3 -eq 3 ]]; then
    SCOLB='\033[1;42m'	
  elif [[ $par3 -eq 4 ]]; then
    SCOLB='\033[1;44m'	
  elif [[ $par3 -eq 5 ]]; then
    SCOLB='\033[1;45m'	
  elif [[ $par3 -eq 6 ]]; then
    SCOLB='\033[1;40m'	
  fi

  if [[ $par4 -eq 1 ]]; then
    SCOL='\033[1;37m'
  elif [[ $par4 -eq 2 ]]; then
    SCOL='\033[1;31m'
  elif [[ $par4 -eq 3 ]]; then
    SCOL='\033[1;32m'
  elif [[ $par4 -eq 4 ]]; then
    SCOL='\033[1;34m'
  elif [[ $par4 -eq 5 ]]; then
    SCOL='\033[1;35m'
  elif [[ $par4 -eq 6 ]]; then
    SCOL='\033[1;30m'
  fi
  
  echo -e "$(awk '{ printf "%s%s%s%s %s %s%s%s %s %s %s %s%s\n", v1, v2, $1, v5, $2, v3, v4, $3, $4, $5, $6, $7, v5 }' v1="$COLB" v2="$COL" v3="$SCOLB" v4="$SCOL" v5="$ENDCOL" 1.status)"
  echo -en "\n"
  source outputsettings.sh
else
  echo -e "Colors of text and background can't be equal.\nPlease run programm again and choose another settings."
  exit 1
fi

rm 1.status
exit 0
