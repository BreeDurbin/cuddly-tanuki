#!/bin/csh
#AUTHOR:     Brian Durbin
#NAME:          Brian's AWESOME script of AMAZINGNESS +5.
#DATE DUE:  10-21-15
#DESCRIPTION:       Checks to see if the user has logged into the correct terminal.
#
#EXIT VALUES
#                       0        file does not exist
#                      10        incorrect number of arguments
#                      20


if ($#argv != 2) then
	echo "You need 2 arguments."
        exit 10
        
    endif

if (( ! -f "$argv[1]" )) then
	echo "$argv[1] is not a file";
	exit 20
	endif

if (( ! -d "$argv[2]" )) then
	echo "$argv[2] is not a directory";
	exit 20
	endif


cp `cat $argv[1]` $argv[2]





