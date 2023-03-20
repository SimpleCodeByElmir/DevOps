#!/bin/bash

source settings.conf

if [[ $1 ]]; then
  echo "Put parameters in the settings.conf file. Not in command line."
  rm 1.status
  exit 1
fi

###EMPTINESS CHECK START###
###|||column1_background|||###
if [[ -z  "${column1_background}" ]]; then
  column1_background=6
  flag1=1
  if [[ $column1_font_color -eq 6 ]]; then
    column1_background=1
    flag2=2
  fi
fi

###|||column1_font_color|||###
if [[ -z  "${column1_font_color}" ]]; then
  column1_font_color=1
  flag3=3
  if [[ $column1_background -eq 1 ]]; then
    column1_font_color=6
    flag4=4
  fi
fi

###|||column2_background|||###
if [[ -z  "${column2_background}" ]]; then
  column2_background=6
  flag5=5
  if [[ $column2_font_color -eq 6 ]]; then
    column2_background=1
    flag6=6
  fi
fi

###|||column2_font_color|||###
if [[ -z  "${column2_font_color}" ]]; then
  column2_font_color=1
  flag7=7
  if [[ $column2_background -eq 1 ]]; then
    column2_font_color=6
    flag8=8
  fi
fi
###EMPTINESS CHECK END###


###CHECK#3 NON-DIGIT SYMBOLS FILTER###
if [[ ! $column1_background =~ ^[1-6]+$
        || ! $column1_font_color =~ ^[1-6]+$
        || ! $column2_background =~ ^[1-6]+$
        || ! $column2_font_color =~ ^[1-6]+$ ]]; then
  echo "Invalid input. Only digits please."
  rm 1.status
  exit 1
fi


###LESS/MORE CHECK START###
if [[ $column1_background -lt 1 || $column1_background -gt 6 || 
	$column1_font_color -lt 1 || $column1_font_color -gt 6 || 
	$column2_background -lt 1 || $column2_background -gt 6 || 
	$column2_font_color -lt 1 || $column2_font_color -gt 6 ]]; then
  echo "Invalid input. Choose a number from 1 to 6."
  rm 1.status
  exit 1
fi
