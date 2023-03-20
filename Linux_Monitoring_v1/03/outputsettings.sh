#!/bin/bash


###############||||DEFAULT_CONFIG||||##################
if [[ $column1_background -eq 6 && $column1_font_color -eq 1 && $column2_background -eq 6 && $column2_font_color -eq 1 ]]; then
  echo "Column 1 background = default (black)"
  echo "Column 1 font color = default (white)"
  echo "Column 2 background = default (black)"
  echo "Column 2 font color = defualt (white)"
  rm 1.status
  exit 0
fi


###############||||COLUMN_1_BACKGROUND||||##################
if [[ $column1_background -eq 1 && $flag1 != 1 ]]; then
  par1="white"
  echo "Column 1 background = $column1_background ($par1)"
elif [[ $column1_background -eq 2 ]]; then
  par1="red"
  echo "Column 1 background = $column1_background ($par1)"
elif [[ $column1_background -eq 3 ]]; then
  par1="green"
  echo "Column 1 background = $column1_background ($par1)"
elif [[ $column1_background -eq 4 ]]; then
  par1="blue"
  echo "Column 1 background = $column1_background ($par1)"
elif [[ $column1_background -eq 5 ]]; then
  par1="purple"
  echo "Column 1 background = $column1_background ($par1)"
elif [[ "$column1_background" -eq 6 && $flag1 != 1 ]]; then
  par1="black"	
  echo "Column 1 background = $column1_background ($par1)"
fi

if [[ $column1_background -eq 6 && $flag1 -eq 1 && $flag2 != 2 ]]; then
  echo "Column 1 background = default (black)"
elif [[ $column1_background -eq 1 && $flag1 -eq 1 && $flag2 -eq 2 ]]; then
  echo "Column 1 background = default (white)"
fi


###############||||COLUMN_1_FONT_COLOR||||##################
if [[ $column1_font_color -eq 1 && $flag3 != 3 ]]; then
  par2="white"
  echo "Column 1 font color = $column1_font_color ($par2)"
elif [[ $column1_font_color -eq 2 ]]; then
  par2="red"
  echo "Column 1 font color = $column1_font_color ($par2)"
elif [[ $column1_font_color -eq 3 ]]; then
  par2="green"
  echo "Column 1 font color = $column1_font_color ($par2)"
elif [[ $column1_font_color -eq 4 ]]; then
  par2="blue"
  echo "Column 1 font color = $column1_font_color ($par2)"
elif [[ $column1_font_color -eq 5 ]]; then
  par2="purple"
  echo "Column 1 font color = $column1_font_color ($par2)"
elif [[ $column1_font_color -eq 6 && $flag3 != 3 ]]; then
  par2="black"
  echo "Column 1 font color = $column1_font_color ($par2)"
fi

if [[ $column1_font_color -eq 1 && $flag3 -eq 3 && $flag4 != 4 ]]; then
  echo "Column 1 font color = default (white)"
elif [[ $column1_font_color -eq 6 && $flag3 -eq 3 && $flag4 -eq 4 ]]; then
  echo "Column 1 font color = default (black)"
fi


###############||||COLUMN_2_BACKGROUND||||##################
if [[ $column2_background -eq 1 && $flag5 != 5 ]]; then
  par3="white"
  echo "Column 2 background = $column2_background ($par3)"
elif [[ $column2_background -eq 2 ]]; then
  par3="red"
  echo "Column 2 background = $column2_background ($par3)"
elif [[ $column2_background -eq 3 ]]; then
  par3="green"
  echo "Column 2 background = $column2_background ($par3)"
elif [[ $column2_background -eq 4 ]]; then
  par3="blue"
  echo "Column 2 background = $column2_background ($par3)"
elif [[ $column2_background -eq 5 ]]; then
  par3="purple"
  echo "Column 2 background = $column2_background ($par3)"
elif [[ $column2_background -eq 6 && $flag5 != 5 ]]; then
  par3="black"
  echo "Column 2 background = $column2_background ($par3)"
fi

if [[ $column2_background -eq 6 && $flag5 -eq 5 && $flag6 != 6 ]]; then
  echo "Column 2 background = default (black)"
elif [[ $column2_background -eq 1 && $flag5 -eq 5 && $flag6 -eq 6 ]]; then
  echo "Column 2 background = default (white)"
fi


###############||||COLUMN_2_FONT_COLOR||||##################
if [[ $column2_font_color -eq 1 && $flag7 != 7 ]]; then
  par4="white"
  echo "Column 2 font color = $column2_font_color ($par4)"	
elif [[ $column2_font_color -eq 2 ]]; then
  par4="red"
  echo "Column 2 font color = $column2_font_color ($par4)"	
elif [[ $column2_font_color -eq 3 ]]; then
  par4="green"
  echo "Column 2 font color = $column2_font_color ($par4)"	
elif [[ $column2_font_color -eq 4 ]]; then
  par4="blue"
  echo "Column 2 font color = $column2_font_color ($par4)"	
elif [[ $column2_font_color -eq 5 ]]; then
  par4="purple"
  echo "Column 2 font color = $column2_font_color ($par4)"	
elif [[ $column2_font_color -eq 6 && $flag7 != 7 ]]; then
  par4="black"
  echo "Column 2 font color = $column2_font_color ($par4)"	
fi

if [[ $column2_font_color -eq 1 && $flag7 -eq 7 && $flag8 != 8 ]]; then
  echo "Column 2 font color = default (white)"
elif [[ $column2_font_color -eq 6 && $flag7 -eq 7 && $flag8 -eq 8 ]]; then
  echo "Column 2 font color = default (black)"
fi
