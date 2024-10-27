#!/bin/bash

#This script makes process of testing a sql-query easier.
#So, there is no need to log in psql-console.
#The script makes everything for us.

#If doesn't work then try 'sudo chmod o+x 1_run_query.sh' 


file=$1  #choose a file which contains query (f.e. bash ex00/day00_ex00.sql)
psql -U sql_elmir -d sql_elmir -f $file  #DB console runs a command from a file (psql --user x --db_name x --filename)
